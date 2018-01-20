class Shards::ShowPage < MainLayout
  needs shard : Shard

  def inner
    h1 @shard.full_name

    para @shard.description

    table do
      tr do
        td "Forks"
        td @shard.forks_count
      end
      tr do
        td "Stars"
        td @shard.stargazers_count
      end
      tr do
        td "Subscribers"
        td @shard.subscribers_count
      end
      tr do
        td "Watchers"
        td @shard.watchers_count
      end
    end
  end
end
