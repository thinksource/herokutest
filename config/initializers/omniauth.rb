Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, Rails.application.secrets.omniauth_provider_key, Rails.application.secrets.omniauth_provider_secret
  provider :facebook, "255201298234437",'a96756a202e61b800d21787eddc31bc0',
           callback_url: "http://localhost:3000/auth/facebook/callback"  
end
