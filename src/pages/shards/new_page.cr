class Shards::NewPage < MainLayout
  include Shards::ShardCreationForm
  needs shard_form : ShardForm

  def inner
    h1 "Add a new shard"

    render @shard_form
  end
end
