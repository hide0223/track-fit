class Training < ApplicationRecord
  belongs_to :customer
  has_many :training_comments, dependent: :destroy
  has_many :training_contents, inverse_of: :training
  accepts_nested_attributes_for :training_contents, reject_if: :all_blank, allow_destroy: true
  has_one_attached :image

  # validates :body_parts, presence: true
  # validates :exercise, presence: true
  # validates :weight, presence: true
  # validates :sets, presence: true
  # validates :reps, presence: true
end
