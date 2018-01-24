class ShardQuery < Shard::BaseQuery
  def popular_first
    table = ShardForm.new.table_name
    query = [
      forks_count.column,
      "#{table}.#{stargazers_count.column}",
      "#{table}.#{subscribers_count.column}",
      "#{table}.#{watchers_count.column}"
    ].join(" + ")
    order_by(query, :desc)
  end
end
