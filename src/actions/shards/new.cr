class Shards::New < BrowserAction
  action do
    render NewPage, shard_form: ShardForm.new
  end
end
