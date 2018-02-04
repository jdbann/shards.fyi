class Shards::IndexPage < MainLayout
  include Shards::ShardComponent
  include Shards::ShardCreationForm

  needs shards : ShardQuery
  needs shard_form : ShardForm

  def content
    div class: "shard-intro" do
      h1 "shards.fyi"

      para "A (soon-to-be) categorised collection of Crystal shards, sorted by
        interest on GitHub."
      para "Still growing so please submit a shard you're using below."

      render @shard_form
    end

    h2 "All Shards"

    @shards.each do |shard|
      render(shard)
    end
  end
end
