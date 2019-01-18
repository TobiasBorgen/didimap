class FoodItem < ApplicationRecord
  validates :id, uniqueness: true
end