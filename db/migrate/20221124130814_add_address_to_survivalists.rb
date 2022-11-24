class AddAddressToSurvivalists < ActiveRecord::Migration[7.0]
  def change
    add_column :survivalists, :address, :string
  end
end
