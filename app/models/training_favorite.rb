class TrainingFavorite < ApplicationRecord
  belongs_to :customer
  belongs_to :training
end
