class Home::Index < BrowserAction
  get "/" do
    redirect to: Shards::Index
  end
end
