# == Schema Information
#
# Table name: place_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PlaceType < ApplicationRecord
  has_many :place_place_types
end
