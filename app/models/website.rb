# == Schema Information
#
# Table name: websites
#
#  id         :integer          not null, primary key
#  name       :string
#  link       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Website < ApplicationRecord
  has_many :reviews
end
