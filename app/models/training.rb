class Training < ApplicationRecord
  has_one :record, as: :content
end
