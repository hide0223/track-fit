class Meal < ApplicationRecord
  belongs_to :customer
  has_many :meal_comments, dependent: :destroy
  has_many :meal_favorites, dependent: :destroy

  has_many :meal_contents, inverse_of: :meal
  accepts_nested_attributes_for :meal_contents, reject_if: :all_blank, allow_destroy: true
  has_one_attached :image

  def favorited_by?(customer)
    meal_favorites.where(customer_id: customer.id).exists?
  end

  # validates :category, presence: true
  # validates :meal_summary, presence: true
  # validates :eat_meal, presence: true
  # validates :kcal, presence: true

end
