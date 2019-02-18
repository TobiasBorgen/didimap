class CreateFoodProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :food_products do |t|
      t.string  :food, presence: true, limit: 200
      t.string  :ingredients
      t.string  :image_path
      t.integer :proteins_per_100
      t.integer :carbohydrates_per_100
      t.integer :fat_per_100
      t.integer :calories_per_100
      t.integer :calories_total
      t.integer :weight
      t.string  :oligo_value, default: 'unknown'
      t.string  :fructose_value, default: 'unknown'
      t.string  :polyol_value, default: 'unknown'
      t.string  :lactose_value, default: 'unknown'
    end
  end
end
