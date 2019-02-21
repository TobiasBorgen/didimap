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
	add_column :food_products, :pean�tter, :bool
	add_column :food_products, :soyab�nner, :bool
	add_column :food_products, :n�tter, :bool
	add_column :food_products, :cashewn�tter, :bool
	add_column :food_products, :hasseln�tter, :bool
	add_column :food_products, :makadamian�tter, :bool
	add_column :food_products, :mandel, :bool
	add_column :food_products, :paran�tter, :bool
	add_column :food_products, :pekann�tter, :bool
	add_column :food_products, :pistasjn�tter, :bool
	add_column :food_products, :valn�tter, :bool
	add_column :food_products, :sesamfr�, :bool
	add_column :food_products, :selleri, :bool
	add_column :food_products, :sennep, :bool
	add_column :food_products, :svoveldioksid_og_sulfitter, :bool
	add_column :food_products, :lupin, :bool
	add_column :food_products, :bl�tdyr, :bool

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
