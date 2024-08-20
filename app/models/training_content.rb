class TrainingContent < ApplicationRecord
  belongs_to :training

  validates :body_parts, presence: true
  validates :exercise, presence: true
  validates :weight, numericality: { greater_than: 0 }
  validates :sets, numericality: { greater_than: 0 }
  validates :reps, numericality: { greater_than: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["body_parts"]
  end
end
