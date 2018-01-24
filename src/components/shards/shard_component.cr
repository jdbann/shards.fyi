module Shards::ShardComponent
  def render(shard : Shard)
    div class: "shard-details" do
      h3 do
        span shard.popularity, class: "shard-popularity"
        link shard.full_name, to: Show.with(id: shard.id)
      end
      div class: "shard-details-columns" do
        div class: "shard-details-description" do
          para "Created #{shard.repo_created_at.to_s("%-d %B %Y")}"
          em do
            para shard.description
          end
        end
        div class: "shard-details-metadata" do
          ul do
            li do
              text "#{shard.stargazers_count} stars"
            end
            li do
              text "#{shard.watchers_count} watchers"
            end
            li do
              text "#{shard.forks_count} forks"
            end
            li do
              text "#{shard.subscribers_count} subscribers"
            end
          end
        end
      end
    end
  end
end
