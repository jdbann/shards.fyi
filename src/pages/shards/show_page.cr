class Shards::ShowPage < MainLayout
  include Shards::ShardComponent

  needs shard : Shard

  def content
    render @shard
  end
end
