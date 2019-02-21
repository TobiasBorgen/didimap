class AddGtinToFoodProducts < ActiveRecord::Migration[5.2]
  def change
	add_column :food_products, :gtin, :string
  end
end
