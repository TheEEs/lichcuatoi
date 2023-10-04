class OmniauthCallbacksController < ApplicationController
  def facebook
    user = User.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |user|
      user.uid = auth[:uid]
      user.provider = auth[:provider]
      user.name = auth[:info][:name]
      user.image = auth[:info][:image]
    end
    if user
      session[:user_id] = user.uid
      redirect_to root_path
    end
  end

  def auth
    request.env['omniauth.auth']
  end
end
