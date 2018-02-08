class Shards::ShowPage < MainLayout
  include Shards::ShardComponent

  needs shard : Shard

  def content
    render @shard, @shard.category
  end

  def page_title
    @shard.name + " - shards.fyi"
  end
end
