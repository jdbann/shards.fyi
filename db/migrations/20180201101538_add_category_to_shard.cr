class AddCategoryToShard::V20180201101538 < LuckyMigrator::Migration::V1
  def migrate
    alter :shards do
      add category_id : Int32?
    end

    execute <<-SQL
      ALTER TABLE shards
      ADD CONSTRAINT shards_category_id_fk
      FOREIGN KEY (category_id)
      REFERENCES categories (id)
      ON DELETE RESTRICT;
    SQL
  end

  def rollback
    alter :shards do
      remove :category_id
    end
  end
end
