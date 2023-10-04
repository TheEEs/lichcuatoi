class OmniauthCallbacksController < ApplicationController
  def facebook
  end

  def auth
    request.env['omniauth.auth']
  end
end
