class TrainingContent < ApplicationRecord
  belongs_to :training

  validates :body_parts, presence: true
  validates :exercise, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["body_parts", "created_at", "exercise", "id", "reps", "sets", "training_id", "updated_at", "weight"]
  end
  
end
