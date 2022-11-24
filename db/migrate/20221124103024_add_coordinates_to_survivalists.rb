class AddCoordinatesToSurvivalists < ActiveRecord::Migration[7.0]
  def change
    add_column :survivalists, :latitude, :float
    add_column :survivalists, :longitude, :float
  end
end
