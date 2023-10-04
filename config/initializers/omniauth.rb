Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
end
if OmniAuth.config.test_mode = true# ENV["RAILS_ENV"]&.downcase == "test"
  OmniAuth.config.mock_auth[:facebook] = Faker::Omniauth.facebook
end
