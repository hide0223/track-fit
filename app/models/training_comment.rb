class TrainingComment < ApplicationRecord
  belongs_to :customer
  belongs_to :training

  validates :comment, presence: true

end
