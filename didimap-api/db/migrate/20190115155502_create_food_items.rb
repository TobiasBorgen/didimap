class CreateFoodItems < ActiveRecord::Migration[5.2]
  def change
    create_table :food_items do |t|
      t.string  :food, presence: true, limit: 100
      t.integer :fodmap_value
      t.boolean :oligo
      t.boolean :fruktose
      t.boolean :polyol
      t.boolean :laktose
      t.string  :desc, default: ""
      t.timestamps
    end
  end
end
