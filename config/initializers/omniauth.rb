Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV.fetch('GOOGLE_ID'), ENV.fetch('GOOGLE_SECRET')
end

# provider :google_oauth2, "595114268591-20munkhdk885gekiicrsi63vq2bhcdff.apps.googleusercontent.com", "FU66OJyGeCa_zFpQ9NvEFP_R"
