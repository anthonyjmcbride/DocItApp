Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_ID'], ENV['GOOGLE_SECRET']
end

# :google_oauth2, ENV.fetch('GOOGLE_ID'), ENV.fetch('GOOGLE_SECRET')
