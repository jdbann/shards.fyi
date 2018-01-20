class ShardForm < Shard::BaseForm
  allow_virtual repo_name : String

  def prepare
    validate_required repo_name

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

  private def repo
    @repo ||= Github::Repo.get(repo_name.value.to_s)
  end
end
