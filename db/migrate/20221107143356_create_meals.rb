class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :image
      t.string :name
      t.string :cuisine
      t.integer :price
      t.string :restaurant
      t.timestamps
    end
  end
end
