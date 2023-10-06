class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :user_signed_in?

  def require_authentication
    redirect_to login_path, alert: "" unless user_signed_in?
  end

  def current_user
    @current_user ||= User.find_by(uid: session[:user_uid]) if session[:user_uid]
  end

  def user_signed_in?
    !!current_user
  end

  def set_current_path
    session[:current_path] = request.env['PATH_INFO']
  end
end
