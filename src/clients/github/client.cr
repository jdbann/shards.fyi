class Github::Client
  def self.get_contents(repo_name : String, path : String)
    Contents.from_json get("repos/#{repo_name}/contents/#{path}")
  rescue Crest::RequestFailed
    raise NoContentsError.new(repo_name, path)
  end

  def self.get_repo(repo_name : String)
    Repo.from_json get("repos/#{repo_name}")
  rescue Crest::RequestFailed
    raise NoRepoError.new(repo_name)
  end

  private def self.get(path : String)
    Crest.get(
      "https://api.github.com/#{path}",
      params: {
        :client_id => ENV["GITHUB_CLIENT_ID"],
        :client_secret => ENV["GITHUB_CLIENT_SECRET"]
      }
    ).body
  end
end
