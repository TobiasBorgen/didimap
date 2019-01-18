class ChangeFoodItems < ActiveRecord::Migration[5.2]
  def change
    change_table :food_items do |t|
      change_column_default  :food_items, :oligo_value, 'low'
      change_column_default  :food_items, :fruktose_value, 'low'
      change_column_default  :food_items, :polyol_value, 'low'
      change_column_default  :food_items, :laktose_value, 'low'
    end
  end
end
