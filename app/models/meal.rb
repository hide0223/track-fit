class Meal < ApplicationRecord
  belongs_to :customer
  has_many :meal_comments, dependent: :destroy
  has_many :meal_favorites, dependent: :destroy

  has_many :meal_contents, inverse_of: :meal, dependent: :destroy
  accepts_nested_attributes_for :meal_contents, reject_if: :all_blank, allow_destroy: true
  has_one_attached :image
  

  def favorited_by?(customer)
    meal_favorites.where(customer_id: customer.id).exists?
  end

  def self.ransackable_attributes(auth_object = nil)
    ["body", "category", "created_at", "customer_id", "id", "title", "updated_at"]
  end


  def self.ransackable_associations(auth_object = nil)
    ["meal_contents"]
  end

  # validates :category, presence: true
  # validates :meal_summary, presence: true
  # validates :eat_meal, presence: true
  # validates :kcal, presence: true

end
