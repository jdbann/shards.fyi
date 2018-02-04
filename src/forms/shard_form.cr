class ShardForm < Shard::BaseForm
  allow category_id
  allow_virtual repo_name : String

  def prepare
    validate_required repo_name
    validate_format_of_repo_name unless repo_name.errors.any?
    validate_uniqueness_of_repo unless repo_name.errors.any?
    validate_repo_is_a_shard unless repo_name.errors.any?

    unless repo_name.errors.any?
      name.value = repo.name
      full_name.value = repo.full_name
      html_url.value = repo.html_url
      description.value = repo.description
      forks_count.value = repo.forks_count
      stargazers_count.value = repo.stargazers_count
      subscribers_count.value = repo.subscribers_count
      repo_created_at.value = repo.created_at
    end
  end

  @_repo : Github::Repo | Nil

  private def repo
    @_repo ||= Github::Repo.get(repo_name.value.to_s)
  end

  private def validate_format_of_repo_name
    repo_name.value.try do |value|
      uri = URI.parse(value)

      if uri.host && !(uri.host =~ /github.com/)
        repo_name.add_error "not a GitHub repo"
      else
        path = uri.host ? uri.path.to_s : value
        repo_name.value = path.split("/", remove_empty: true).first(2).join("/")
      end
    end
  end

  private def validate_repo_is_a_shard
    repo.contents("shard.yml")
  rescue Github::NoRepoError
    repo_name.add_error "could not find this repo"
  rescue Github::NoContentsError
    repo_name.add_error "could not find a shard.yml file"
  end

  private def validate_uniqueness_of_repo
    if ShardQuery.new.full_name.lower.is(repo_name.value.to_s.downcase).size > 0
      repo_name.add_error "already listed"
    end
  end
end
