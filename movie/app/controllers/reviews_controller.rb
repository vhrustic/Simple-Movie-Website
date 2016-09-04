class ReviewsController < ApplicationController
	before_action :authorize
	before_action :own_review, only: [:edit, :update]

	def create
		@film = Film.find(params[:film_id]) 
		@review = Review.create(review_params)
		@film.reviews << @review
		@film.calculate_new_rating(review_params[:score])
		current_user.reviews << @review
		if @review.save && @film.save
			redirect_to film_path(@film)
		else
			@reviews = @film.reviews.paginate(:page => params[:page], :per_page => 4)
      		render 'films/show'
		end
	end

	def edit
		@review = get_own_review(params[:id]) #security, better than find then checking is it user's review
	end

	def update
		@review = get_own_review(params[:id])
		if @review.update(review_params)
			redirect_to @review.film
		else 
			render 'edit'
		end
	end

	private
		def review_params
			params.require(:review).permit(:title, :text, :score)
		end

		def own_review
			redirect_to '/films' unless Review.find(params[:id]).user_id == current_user.id
		end

		def get_own_review(rev_id)
			Review.where({id: rev_id, user_id: session[:id]}).first
		end
end
