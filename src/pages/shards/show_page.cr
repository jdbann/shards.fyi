class Shards::ShowPage < MainLayout
  include Shards::ShardComponent

  needs shard : Shard

  def inner
    render @shard
  end
end
