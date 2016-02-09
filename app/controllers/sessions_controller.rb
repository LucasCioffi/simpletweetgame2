class SessionsController < ApplicationController

  def create_from_omniauth # from http://railscasts.com/episodes/360-facebook-authentication?autoplay=true

    user = User.from_omniauth(env["omniauth.auth"])

    session[:user_unique1] = user.unique1
    redirect_to root_path
  end

  def omniauth_failure
    Rails.logger "omniauth login failed"
    redirect_to root_path
  end

  def destroy
    session[:user_unique1] = nil
    redirect_to root_path
  end
end
