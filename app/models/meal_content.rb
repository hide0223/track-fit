class MealContent < ApplicationRecord
  belongs_to :meal

  def self.ransackable_attributes(auth_object = nil)
    ["eat_meal"]
  end
end
