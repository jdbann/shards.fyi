class Shards::Index < BrowserAction
  action do
    render(
      IndexPage,
      shards: ShardQuery.new.popular_first,
      shard_form: ShardForm.new
    )
  end
end
