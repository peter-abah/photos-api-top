Unsplash.configure do |config|
  config.application_access_key = Figaro.env.unsplash_access_key
  config.application_secret = Figaro.env.unsplash_secret_key
  config.application_redirect_uri = "http://localhost:3000/oauth/callback"
  config.utm_source = "photos-api"
end