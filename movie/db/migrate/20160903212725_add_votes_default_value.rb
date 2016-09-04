class AddVotesDefaultValue < ActiveRecord::Migration[5.0]
  def up
  	change_column_default :films, :votes, 0
  	change_column_default :films, :rating, 1.0
  end
end
