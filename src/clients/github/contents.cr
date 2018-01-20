class Github::Contents
  JSON.mapping(
    name: String,
    path: String,
    sha: String,
    size: Int32,
    html_url: String,
  )
end
