class Categories::Show < BrowserAction
  action do
    render ShowPage, category: category, shards: shards
  end

  private def category
    CategoryQuery.new.preload_shards.find(id)
  end

  private def shards
    ShardQuery.new.category_id(category.id).popular_first
  end
end
