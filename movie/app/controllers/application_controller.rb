class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  private
  	def current_user
  		if session[:id]
  			@current_user ||= User.find(session[:id])
  		end
  		
	end
		def authorize
		redirect_to '/login' unless current_user
	end
end
