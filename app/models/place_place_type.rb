# == Schema Information
#
# Table name: place_place_types
#
#  id            :integer          not null, primary key
#  place_type_id :integer
#  place_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PlacePlaceType < ApplicationRecord
  belongs_to :place
  belongs_to :place_type
end
