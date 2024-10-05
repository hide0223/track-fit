class Meal < ApplicationRecord
  belongs_to :customer
  has_many :meal_comments, dependent: :destroy
  has_many :meal_favorites, dependent: :destroy

  has_many :meal_contents, inverse_of: :meal, dependent: :destroy
  accepts_nested_attributes_for :meal_contents, reject_if: :all_blank, allow_destroy: true
  has_one_attached :image

  validates :category, presence: true

  def favorited_by?(customer)
    meal_favorites.where(customer_id: customer.id).exists?
  end

  def self.ransackable_attributes(auth_object = nil)
    ["body", "category", "created_at", "customer_id", "id", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["meal_contents"]
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @meal = Meal.where("body LIKE?","#{word}")
    elsif search == "forward_match"
      @meal = Meal.where("body LIKE?","#{word}%")
    elsif search == "backward_match"
      @meal = Meal.where("body LIKE?","%#{word}")
    elsif search == "partial_match"
      @meal = Meal.where("body LIKE?","%#{word}%")
    else
      @meal = Meal.all
    end
  end

  scope :active_customers, -> { joins(:customer).where(customers: { is_active: true }) }

  def active_meal_comments
    meal_comments.active_customers
  end

end
