#from PATS2 by Professor Larry Heimann - none of this actually works just yet
class SessionsController < ApplicationController

  def new
  end
  
  def create
    tok = User.authenticate(params[:username], params[:password])
    if not tok.nil?
      session[:user_id] = user.id
      #ENV['OAUTH_DEBUG'] = 'true'
      session[:token] = tok
      user_info = parse_user_info(tok)
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