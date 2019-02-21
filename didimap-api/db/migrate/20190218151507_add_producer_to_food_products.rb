class AddProducerToFoodProducts < ActiveRecord::Migration[5.2]
  def change
  	add_column :food_products, :producer, :string
  end
end
