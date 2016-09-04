class FilmsController < ApplicationController
  before_action :authorize

  def index
  	@films = Film.all
  end

  def show
  	@film = Film.find(params[:id])
    @reviews = @film.reviews.paginate(:page => params[:page], :per_page => 4)
    @review = Review.new
  end

  def new
  	@film = Film.new
  end

  def create
  	@film = Film.new(film_params)
  	if @film.save
  		redirect_to films_path
  	else 
  		render 'new'
  	end
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])
    if @film.update film_params
      redirect_to @film
    else render 'edit'
    end
  end

  def destroy
    Film.find(params[:id]).destroy
    redirect_to films_path
  end

  private
  def film_params
  	params.require(:film).permit(:name, :year, :director, :stars)
  end
end
