class Github::Repo
  JSON.mapping(
    name: String,
    full_name: String,
    html_url: String,
    description: String?,
    forks_count: Int32,
    stargazers_count: Int32,
    subscribers_count: Int32,
    watchers_count: Int32,
    created_at: Time
  )

  def self.get(repo_name : String)
    Client.get_repo(repo_name)
  end

  def contents(path : String)
    Client.get_contents(full_name, path)
  end
end
