require "./server"

Lucky::Session::Store.configure do
  settings.key = "crystal_toolbox"
  settings.secret = Lucky::Server.settings.secret_key_base
end
