class Meal < ApplicationRecord
  has_one :record, as: :content
  has_many :meal_contents
end
