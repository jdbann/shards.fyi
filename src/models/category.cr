class Category < BaseModel
  table :categories do
    column title : String
    has_many shards : Shard
  end
end
