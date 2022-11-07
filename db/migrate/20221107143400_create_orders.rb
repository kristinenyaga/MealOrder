class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :order do |t|
      t.integer :order_number
      t.integer :customer_id
      t.integer :meal_id
      t.timestamps
    end
  end
end
