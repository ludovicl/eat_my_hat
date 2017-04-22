class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  before_save :downcase_fields
  def downcase_fields
    %w(name website map_link link).each do |attr|
      eval(attr).downcase! if self.class.column_names.include?(attr) && !eval(attr).nil?
    end
  end
end
