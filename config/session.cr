require "./server"

Lucky::Session::Store.configure do
  settings.key = "shards_fyi"
  settings.secret = Lucky::Server.settings.secret_key_base
end
