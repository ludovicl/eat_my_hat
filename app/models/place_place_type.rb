class PlacePlaceType < ApplicationRecord
  belongs_to :place
  belongs_to :place_type
end
