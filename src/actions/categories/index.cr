class Categories::Index < BrowserAction
  action do
    render(
      IndexPage,
      categories: CategoryQuery.new
    )
  end
end
