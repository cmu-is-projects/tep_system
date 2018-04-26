#from PATS2 by Professor Larry Heimann - none of this actually works just yet
class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.auth_with_oauth2(params[:username], params[:password])
    if user.has_token?
      session[:user_id] = user.id
      session[:token] = token
      redirect_to home_path, notice: "Logged in!"
    else
      flash.now.alert = "Username and/or password is invalid"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    session[:token] = nil
    redirect_to home_path, notice: "Logged out!"
  end
end