class Categories::ShowPage < MainLayout
  include Shards::ShardComponent

  needs category : Category
  needs shards : ShardQuery

  def content
    h1 @category.title

    @shards.each do |shard|
      render(shard, @category)
    end
  end
end
