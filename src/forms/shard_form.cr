class ShardForm < Shard::BaseForm
  allow_virtual repo_name : String

  def prepare
    validate_required repo_name
    validate_uniqueness_of_repo
    validate_repo_is_a_shard

    name.value = repo.name
    full_name.value = repo.full_name
    html_url.value = repo.html_url
    description.value = repo.description
    forks_count.value = repo.forks_count
    stargazers_count.value = repo.stargazers_count
    subscribers_count.value = repo.subscribers_count
    watchers_count.value = repo.watchers_count
    repo_created_at.value = repo.created_at
  end

  @_repo : Github::Repo | Nil

  private def repo
    @_repo ||= Github::Repo.get(repo_name.value.to_s)
  end

  private def validate_repo_is_a_shard
    repo.contents("shard.yml")
  rescue Github::NoRepoError
    repo_name.add_error "could not find this repo"
  rescue Github::NoContentsError
    repo_name.add_error "could not find a shard.yml file"
  end

  private def validate_uniqueness_of_repo
    if ShardQuery.new.full_name(repo_name.value).size > 0
      repo_name.add_error "already listed"
    end
  end
end
