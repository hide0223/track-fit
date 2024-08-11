class Training < ApplicationRecord
  belongs_to :customer
  has_one_attached :image

  validates :body_parts, presence: true
  validates :exercise, presence: true
  validates :weight, presence: true
  validates :sets, presence: true
  validates :reps, presence: true
end
