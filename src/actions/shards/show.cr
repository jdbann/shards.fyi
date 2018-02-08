class Shards::Show < BrowserAction
  action do
    render ShowPage, shard: shard
  end

  private def shard
    ShardQuery.new.preload_category.find(id)
  end
end
