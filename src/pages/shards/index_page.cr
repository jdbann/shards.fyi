class Shards::IndexPage < MainLayout
  needs shards : ShardQuery
  needs shard_form : ShardForm

  def inner
    h1 "Crystal Toolbox"

    render @shard_form

    h2 "Shards"

    ul do
      @shards.each do |shard|
        li do
          link shard.full_name, to: Show.with(id: shard.id)
        end
      end
    end
  end

  private def render(f : ShardForm)
    form_for Create do
      text_input f.repo_name

      submit "Add"
    end
  end
end
