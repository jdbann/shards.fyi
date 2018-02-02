class MakeShardDescriptionNillable::V20180202164331 < LuckyMigrator::Migration::V1
  def migrate
    execute <<-SQL
      ALTER TABLE shards
      ALTER COLUMN description DROP NOT NULL;
    SQL
  end

  def rollback
    execute "ALTER TABLE shards ALTER COLUMN description SET DEFAULT '';"
    execute "ALTER TABLE shards ALTER COLUMN description SET NOT NULL;"
  end
end
