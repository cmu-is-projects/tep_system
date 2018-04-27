class UsersController < ApplicationController
	def index 
		@users = User.all
	end 

	def new 
		@user = User.new
	end 

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Successfully added #{@user.name}"
			redirect_to users_path
		else 
			render action: 'new'
		end 
	end 

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
	      flash[:notice] = "Successfully removed #{@user.name}."
	      redirect_to users_path
	    else
	      render action: 'index'
	    end
	end 

	private
	def user_params
		params.require(:user).permit(:username, :first_name, :last_name, :email, :role, :active, :password, :password_confirmation)
	end 
end 