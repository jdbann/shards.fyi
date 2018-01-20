class Shards::Create < BrowserAction
  action do
    ShardForm.create(params) do |form, shard|
      if shard
        redirect to: Show.with(id: shard.id)
      else
        render NewPage, shard_form: form
      end
    end
  end
end
