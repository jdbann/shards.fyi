class Shards::NewPage < MainLayout
  needs shard_form : ShardForm

  def inner
    h1 "Add a new shard"

    render @shard_form
  end

  private def render(f : ShardForm)
    form_for Create do
      text_input f.repo_name

      submit "Add"
    end
  end
end
