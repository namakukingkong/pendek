json.results do
  json.origin  @url.origin
  json.short  @url.short
  json.infos do
    json.ip  @url.infos[:ip]
    json.user_agent  @url.infos[:ua]
    json.location  @url.location
    json.browser  @url.browser_name
    json.platform  @url.browser_platform
  end
  json.created_at @url.created_at
  json.updated_at @url.updated_at
end
