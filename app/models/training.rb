class Training < ApplicationRecord
  belongs_to :customer
  has_many :training_comments, dependent: :destroy
  has_many :training_favorites, dependent: :destroy

  has_many :training_contents, inverse_of: :training, dependent: :destroy
  accepts_nested_attributes_for :training_contents, reject_if: :all_blank, allow_destroy: true
  has_one_attached :image

  def favorited_by?(customer)
    training_favorites.where(customer_id: customer.id).exists?
  end

  def self.ransackable_attributes(auth_object = nil)
    ["body", "category", "created_at", "customer_id", "id", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["training_contents"]
  end

  validates :body_parts, presence: true
  validates :exercise, presence: true
  validates :weight, presence: true
  validates :sets, presence: true
  validates :reps, presence: true
end
