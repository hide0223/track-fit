class Meal < ApplicationRecord
  belongs_to :customer

  validates :category, presence: true
  validates :meal_summary, presence: true
  validates :eat_meal, presence: true
  validates :kcal, presence: true

end
