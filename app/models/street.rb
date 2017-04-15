class Street < ApplicationRecord
  belongs_to :zipcode
  has_many :place
end
