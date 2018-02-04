class ShardQuery < Shard::BaseQuery
  def popular_first
    query = [
      forks_count.column,
      stargazers_count.column,
      subscribers_count.column,
    ].join(" + ")
    order_by(query, :desc)
  end
end
