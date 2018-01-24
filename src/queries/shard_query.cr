class ShardQuery < Shard::BaseQuery
  def popular_first
    order_by(
      "forks_count + stargazers_count + subscribers_count + watchers_count",
      :desc
    )
  end
end
