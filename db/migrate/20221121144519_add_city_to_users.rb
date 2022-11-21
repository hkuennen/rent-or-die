class AddCityToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :city, :string, null: false
  end
end
