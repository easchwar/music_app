class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def log_in_user!
    @user.reset_session_token!
    session[:session_token] = @user.session_token
  end

  def logged_in?
    User.exists?(session_token: session[:session_token])
  end

  private

  def require_login
    unless logged_in?
      redirect_to new_session_url
    end
  end
end
