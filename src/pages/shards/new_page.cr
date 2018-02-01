class Shards::NewPage < MainLayout
  needs shard_form : ShardForm

  def inner
    h1 "Add a new shard"

    render @shard_form
  end

  private def render(f : ShardForm)
    form_for Create do
      text_input f.repo_name
      errors_for f.repo_name
      select_input f.category_id do
        options_for_select(f.category_id, categories_for_select)
      end

      submit "Add"
    end
  end

  private def categories_for_select
    CategoryQuery.new.map do |category|
      {category.title, category.id}
    end
  end
end
