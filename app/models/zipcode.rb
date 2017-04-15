class Zipcode < ApplicationRecord
  belongs_to :city

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end
end
