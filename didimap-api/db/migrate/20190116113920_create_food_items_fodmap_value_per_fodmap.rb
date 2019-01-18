class CreateFoodItemsFodmapValuePerFodmap < ActiveRecord::Migration[5.2]
  def change
    change_table :food_items do |t|
      t.remove  :fodmap_value, :oligo, :fruktose, :polyol, :laktose
      t.string  :oligo_value
      t.string  :fruktose_value
      t.string  :polyol_value
      t.string  :laktose_value
    end
  end
end
