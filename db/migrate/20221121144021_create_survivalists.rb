class CreateSurvivalists < ActiveRecord::Migration[7.0]
  def change
    create_table :survivalists do |t|
      t.string :name
      t.string :category
      t.string :skills
      t.string :street
      t.string :postcode
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
