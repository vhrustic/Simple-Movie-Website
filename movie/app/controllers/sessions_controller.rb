class SessionsController < ApplicationController
	def new
	end

	def create
		id = User.authenticate(params[:username], params[:password]) #check if users exists
		if id != -1
			session[:id] = id
			redirect_to '/films'
		else
			flash[:alert] = "Login failed. Try again and your username and password."
			redirect_to :action => :new
		end
	end

	def destroy
	end
end
