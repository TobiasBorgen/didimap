class UserTestedIngredient < ApplicationRecord
  validates :food, uniqueness: true
end