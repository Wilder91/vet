Rails.application.config.middleware.use OmniAuth::Builder do
<<<<<<< HEAD
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end 
    OmniAuth.config.allowed_request_methods = %i[get]
=======
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  end 
>>>>>>> parent of 874782d (Bug Detected With Omniauth)
