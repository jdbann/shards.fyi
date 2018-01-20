class Github::Client
  def self.get_repo(repo_name : String)
    Repo.from_json get("repos/#{repo_name}")
  end

  private def self.get(path : String)
    Crest.get("https://api.github.com/#{path}").body
  end
end
