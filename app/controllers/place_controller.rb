class PlaceController < ApplicationController
  include Markers
  def index
    @zipcodes = Zipcode.select(:name, :id).uniq.order(:name)
    @websites = Website.select(:name, :id, :link).uniq.order(:name)
    @place_types = PlaceType.select(:name, :id).uniq.order(:name)
  end

  def load_markers(_filters = nil)
    update_markers
  end
end
