# == Schema Information
#
# Table name: zipcodes
#
#  id         :integer          not null, primary key
#  name       :string
#  city_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Zipcode < ApplicationRecord
  belongs_to :city

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end
end
