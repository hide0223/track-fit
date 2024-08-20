class TrainingContent < ApplicationRecord
  belongs_to :training

  def self.ransackable_attributes(auth_object = nil)
    ["body_parts"]
  end
end
