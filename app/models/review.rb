class Review < ApplicationRecord
  belongs_to :place
  belongs_to :website
end
