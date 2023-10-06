Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
  provider :developer unless Rails.env.production?
end
if OmniAuth.config.test_mode = ENV["RAILS_ENV"]&.downcase == "test"
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new Faker::Omniauth.facebook
end
