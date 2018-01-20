module Github
  # Generic error
  class GithubError < Exception
  end

  # Raised when a repo request returns an error
  class NoRepoError < GithubError
    def initialize(repo_name : String)
      super "Could not find #{repo_name}"
    end
  end

  # Raised when a contents request returns an error
  class NoContentsError < GithubError
    def initialize(repo_name : String, path : String)
      super "Could not find #{path} in #{repo_name}"
    end
  end
end
