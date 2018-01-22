class Shards::IndexPage < MainLayout
  include Shards::ShardComponent

  needs shards : ShardQuery
  needs shard_form : ShardForm

  def inner
    h1 "Crystal Toolbox"

    render @shard_form

    h2 "Shards"

    @shards.each do |shard|
      render(shard)
    end
  end

  private def render(f : ShardForm)
    form_for Create do
      text_input f.repo_name

      submit "Add"
    end
  end
end
