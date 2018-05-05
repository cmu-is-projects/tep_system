class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	#before_action :check_login
	authorize_resource

	def index 
		@users = User.all.paginate(page: params[:page]).per_page(15)
	end 

	def new 
		@user = User.new
	end 

	def edit
		#@user.role = "volunteer" if current_user.role?(:volunteer)
	end

	def create
		@user = User.new(user_params)
		#@user.role = "volunteer" if current_user.role?(:volunteer)
		if @user.save
			flash[:notice] = "Successfully added #{@user.name} as a user"
			redirect_to users_path
		else 
			render action: 'new'
		end 
	end 

	def update
	    if @user.update_attributes(user_params)
	      flash[:notice] = "Successfully updated #{@user.first_name}."
	      redirect_to users_url
	    else
	      render action: 'edit'
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
	def set_user
      @user = User.find(params[:id])
    end

	def user_params
		params.require(:user).permit(:username, :first_name, :last_name, :email, :role, :active, :password, :password_confirmation)
	end 
end 