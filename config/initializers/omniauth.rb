Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  end 

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  {
      scope: 'userinfo.email, userinfo.profile, http://gdata.youtube.com',
      prompt: 'select_account',
      image_aspect_ratio: 'square',
      image_size: 50
    }
end
OmniAuth.config.allowed_request_methods = %i[get]