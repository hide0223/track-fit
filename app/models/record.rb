class Record < ApplicationRecord
  belongs_to :customer
  belongs_to :content, polymorphic: true


end
