module Shards::ShardCreationForm
  def render_shard_form(form : ShardForm)
    form_for Create do
      text_input form.repo_name, placeholder: "user/repo_name"
      errors_for form.repo_name
      select_input form.category_id do
        options_for_select(form.category_id, categories_for_select)
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
