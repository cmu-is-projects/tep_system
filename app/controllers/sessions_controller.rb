#from PATS2 by Professor Larry Heimann - none of this actually works just yet
class SessionsController < ApplicationController

  def new
  end
  
  def create
    # tok = User.authenticate(params[:username], params[:password])
    # if not tok.nil?
    user = User.authenticate(params[:username], params[:password])
    # if not tok.nil?
    if user
      session[:user_id] = user.id
      redirect_to home_path, notice: "Logged in!"
    else
      flash.now.alert = "Username and/or password is invalid"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to home_path, notice: "Logged out!"
  end
end