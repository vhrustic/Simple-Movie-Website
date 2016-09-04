class ReviewsController < ApplicationController
	def create
		@film = Film.find(params[:film_id]) 
		@review = Review.create(review_params)
		@film.reviews << @review
		@film.calculate_new_rating(review_params[:score])
		current_user.reviews << @review
		if @review.save && @film.save
			redirect_to film_path(@film)
		else
			render film_path(@film)
		end
	end

	private
		def review_params
			params.require(:review).permit(:title, :text, :score)
		end
end
