# == Schema Information
#
# Table name: streets
#
#  id         :integer          not null, primary key
#  name       :string
#  zipcode_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Street < ApplicationRecord
  belongs_to :zipcode
  has_many :place
end
