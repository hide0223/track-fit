class MealContent < ApplicationRecord
  belongs_to :meal

  validates :meal_summary, presence: true
  validates :eat_meal, presence: true
  validates :kcal, numericality: { greater_than: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["eat_meal"]
  end
end
