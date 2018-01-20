class CreateShards::V20180120144605 < LuckyMigrator::Migration::V1
  def migrate
    create :shards do
      add name : String
      add full_name : String
      add html_url : String
      add description : String
      add forks_count : Int32
      add stargazers_count : Int32
      add subscribers_count : Int32
      add watchers_count : Int32
      add repo_created_at : Time
    end
  end

  def rollback
    drop :shards
  end
end
