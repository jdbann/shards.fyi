class Shard < BaseModel
  table :shards do
    field name : String
    field full_name : String
    field html_url : String
    field description : String
    field forks_count : Int32
    field stargazers_count : Int32
    field subscribers_count : Int32
    field watchers_count : Int32
    field repo_created_at : Time
  end

  def popularity
    forks_count + stargazers_count + subscribers_count + watchers_count
  end
end
