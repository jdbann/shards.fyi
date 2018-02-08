class Categories::IndexPage < MainLayout
  needs categories : CategoryQuery

  def content
    ul do
      @categories.each do |category|
        li do
          link category.title, to: Categories::Show.with(id: category.id)
        end
      end
    end
  end
end
