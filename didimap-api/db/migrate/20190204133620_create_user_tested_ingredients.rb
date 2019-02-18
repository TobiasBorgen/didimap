class CreateUserTestedIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tested_ingredients do |t|
      t.string  :food, presence: true, limit: 100
      t.integer :users_with_symptoms
      t.integer :users_without_symptoms
    end
  end
end
