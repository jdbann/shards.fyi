class Shards::Create < BrowserAction
  action do
    ShardForm.new(params).submit do |form, repo_name|
      if repo_name
        render_text "Tried to add #{repo_name}"
      else
        render NewPage, shard_form: form
      end
    end
  end
end
