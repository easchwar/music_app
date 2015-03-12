class SessionsController < ApplicationController
  before_action :ensure_not_logged_in, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],
                                     params[:user][:password])

    if @user
      log_in_user!
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid login"]
      @user = User.new(email: params[:user][:email])
      render :new
    end
  end

  def destroy
    @user = User.find_by_session_token(session[:session_token])
    session[:session_token] = nil
    @user.reset_session_token!
    redirect_to new_session_url
  end

  private

  def ensure_not_logged_in
    user = User.find_by_session_token(session[:session_token])
    if user
      redirect_to user_url(user)
    end
  end
end
