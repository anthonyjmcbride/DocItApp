Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_ID'], ENV['GOOGLE_SECRET']
end
<<<<<<< HEAD
=======

# :google_oauth2, ENV.fetch('GOOGLE_ID'), ENV.fetch('GOOGLE_SECRET')
>>>>>>> dfc2eac867d7be703f16c18d955701245c404f6c
