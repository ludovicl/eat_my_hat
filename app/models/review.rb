# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  name       :string
#  link       :string
#  place_id   :integer
#  website_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ApplicationRecord
  belongs_to :place
  belongs_to :website
end
