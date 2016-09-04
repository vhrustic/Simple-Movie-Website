class AddVotesToFilm < ActiveRecord::Migration[5.0]
  def change
    add_column :films, :votes, :integer
  end
end
