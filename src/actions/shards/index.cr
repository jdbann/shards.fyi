class Shards::Index < BrowserAction
  action do
    render(
      IndexPage,
      shards: shards,
      categories: categories,
      shard_form: ShardForm.new
    )
  end

  private def categories
    CategoryQuery.new
  end

  private def shards
    ShardQuery.new.preload_category.popular_first
  end
end
