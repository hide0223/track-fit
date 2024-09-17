class MealComment < ApplicationRecord
  belongs_to :customer
  belongs_to :meal

  validates :comment, presence: true

  scope :active_customers, -> { joins(:customer).where(customers: { is_active: true }) }
end
