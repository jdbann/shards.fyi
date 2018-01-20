class Shards::Index < BrowserAction
  action do
    render IndexPage, shards: ShardQuery.new, shard_form: ShardForm.new
  end
end
