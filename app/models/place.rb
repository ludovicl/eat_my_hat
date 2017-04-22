# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
#  name       :string
#  website    :string
#  map_link   :string
#  lonlat     :geography({:srid point, 4326
#  street_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Place < ApplicationRecord
  belongs_to :street
  has_many :reviews
  has_many :place_place_types
  has_many :place_types, through: :place_place_types
  scope :filter_on_zipcode, lambda { |zipcodes_id|
    unless zipcodes_id.blank?
      joins(:street).where(Street.arel_table[:zipcode_id].in(zipcodes_id))
    end
  }

  scope :filter_on_website, lambda { |websites_id|
    unless websites_id.blank?
      joins(:reviews).where(Review.arel_table[:website_id].in(websites_id))
    end
  }

  scope :filter_on_restaurant_type, lambda { |types_id|
    unless types_id.blank?
      joins(:place_place_types).where(PlacePlaceType.arel_table[:place_type_id].in(types_id))
    end
  }
end
