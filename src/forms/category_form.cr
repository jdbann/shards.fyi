class CategoryForm < Category::BaseForm
  allow title

  def prepare
    validate_uniqueness_of_title
  end

  def validate_uniqueness_of_title
    if CategoryQuery.new.title.lower.is(title.value.to_s.downcase).size > 0
      title.add_error "already exists"
    end
  end
end
