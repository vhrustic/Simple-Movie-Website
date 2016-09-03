class UsersController < ApplicationController
	before_action :authorize, only: [:edit, :profile]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save 
			session[:id] = @user.id
			redirect_to '/'
		else
			render 'new'
		end
	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(current_user.id)
		if @user.update(user_params)
			redirect_to profile_path
		else
			render 'edit'
		end
	end

	def profile
		@user = current_user
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
