class MealContent < ApplicationRecord
  belongs_to :meal

  validates :meal_summary, presence: { message: "食事概要を入力してください" }
  validates :eat_meal, presence: true
  validates :kcal, numericality: { greater_than: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["eat_meal"]
  end
end
