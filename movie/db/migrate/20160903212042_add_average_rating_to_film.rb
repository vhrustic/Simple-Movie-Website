class AddAverageRatingToFilm < ActiveRecord::Migration[5.0]
  def change
  	  add_column :films, :rating, :float
  end
end
