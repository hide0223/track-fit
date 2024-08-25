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

  def self.looks(search, word)
    if search == "perfect_match"
      @training = Training.where("body LIKE?","#{word}")
    elsif search == "forward_match"
      @training = Training.where("body LIKE?","#{word}%")
    elsif search == "backward_match"
      @training = Training.where("body LIKE?","%#{word}")
    elsif search == "partial_match"
      @training = Training.where("body LIKE?","%#{word}%")
    else
      @training = Training.all
    end
  end

end
