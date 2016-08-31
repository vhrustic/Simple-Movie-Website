class FilmsController < ApplicationController
  def index
  	@films = Film.all
  end

  def show
  	@film = Film.find(params[:id])
  end

  def new
  	@film = Film.new
  end

  def create
  	@film = Film.new(film_params)
  	if @film.save
  		redirect_to @film
  	else 
  		render 'new'
  	end
  end

  def edit
  end

  private
  def film_params
  	params.require(:film).permit(:name, :year, :director, :stars)
  end
end
