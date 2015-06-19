json.results do
  json.origin @url.origin
  json.short "#{root_url(:only_path => false)}#{@url.short}"
  json.infos do
    json.array!(@url.infos) do |info|
      json.ip info.raw[:ip]
      json.user_agent info.raw[:ua]
      json.location info.location
      json.browser info.browser_name
      json.platform info.browser_platform
    end
  end
end
