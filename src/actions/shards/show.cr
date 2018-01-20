class Shards::Show < BrowserAction
  action do
    render ShowPage, shard: shard
  end

  private def shard
    ShardQuery.new.find(id)
  end
end
