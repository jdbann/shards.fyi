class AddCategories::V20180131140018 < LuckyMigrator::Migration::V1
  def migrate
    create :categories do
     add title : String
    end
  end

  def rollback
    drop :categories
  end
end
