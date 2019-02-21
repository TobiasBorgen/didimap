class AddAllergensToFoodProducts < ActiveRecord::Migration[5.2]
  def change
	add_column :food_products, :gluten, :bool
	add_column :food_products, :bygg, :bool
	add_column :food_products, :havre, :bool
	add_column :food_products, :hvete, :bool
	add_column :food_products, :kamut, :bool
	add_column :food_products, :rug, :bool
	add_column :food_products, :spelt, :bool
	add_column :food_products, :skalldyr, :bool
	add_column :food_products, :fisk, :bool
	add_column :food_products, :egg, :bool
	add_column :food_products, :melk, :bool
	add_column :food_products, :peanøtter, :bool
	add_column :food_products, :soyabønner, :bool
	add_column :food_products, :nøtter, :bool
	add_column :food_products, :cashewnøtter, :bool
	add_column :food_products, :hasselnøtter, :bool
	add_column :food_products, :makadamianøtter, :bool
	add_column :food_products, :mandel, :bool
	add_column :food_products, :paranøtter, :bool
	add_column :food_products, :pekannøtter, :bool
	add_column :food_products, :pistasjnøtter, :bool
	add_column :food_products, :valnøtter, :bool
	add_column :food_products, :sesamfrø, :bool
	add_column :food_products, :selleri, :bool
	add_column :food_products, :sennep, :bool
	add_column :food_products, :svoveldioksid_og_sulfitter, :bool
	add_column :food_products, :lupin, :bool
	add_column :food_products, :bløtdyr, :bool

	add_column :food_products, :laktose_redusert, :bool
	add_column :food_products, :glutenfri, :bool
	add_column :food_products, :laktosefri, :bool
	add_column :food_products, :melkeprotein_fri, :bool
	add_column :food_products, :melkefri, :bool
	add_column :food_products, :glutenfri, :bool

	remove_column :food_products, :proteins_per_100
	remove_column :food_products, :carbohydrates_per_100
	remove_column :food_products, :fat_per_100
	remove_column :food_products, :calories_per_100

	add_column :food_products, :proteins, :integer
	add_column :food_products, :carbohydrates, :integer
	add_column :food_products, :fat, :integer
  end
end
