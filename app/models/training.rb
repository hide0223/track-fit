class Training < ApplicationRecord
  belongs_to :customer
  has_many :training_comments, dependent: :destroy
  has_many :training_favorites, dependent: :destroy

  has_many :training_contents, inverse_of: :training
  accepts_nested_attributes_for :training_contents, reject_if: :all_blank, allow_destroy: true
  has_one_attached :image

  def favorited_by?(customer)
    training_favorites.where(customer_id: customer.id).exists?
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Training.where(body: content)
    elsif method == 'forward'
      Training.where('body LIKE ?', content+'%')
    elsif method == 'backward'
      Training.where('body LIKE ?', '%'+content)
    else
      Training.where('body LIKE ?', '%'+content+'%')
    end
  end
  # validates :body_parts, presence: true
  # validates :exercise, presence: true
  # validates :weight, presence: true
  # validates :sets, presence: true
  # validates :reps, presence: true
end
