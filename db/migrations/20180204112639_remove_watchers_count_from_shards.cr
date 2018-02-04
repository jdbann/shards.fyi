class RemoveWatchersCountFromShards::V20180204112639 < LuckyMigrator::Migration::V1
  def migrate
    alter :shards do
      remove :watchers_count
    end
  end

  def rollback
    alter :shards do
      add watchers_count : Int32, fill_existing_with: 0
    end
  end
end
