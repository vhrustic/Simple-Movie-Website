class UsersController < ApplicationController
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
	end

	def update
	end

	def profile
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
