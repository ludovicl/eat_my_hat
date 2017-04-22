module Markers
  extend ActiveSupport::Concern
  def update_markers(filters = { filters_id: {} })
    filters.symbolize_keys!
    places = Place.includes(street: [zipcode: :city],
                            reviews: :website,
                            place_place_types: :place_type)
                  .filter_on_zipcode(filters[:filters_id]['zipcode'])
                  .filter_on_website(filters[:filters_id]['website'])
                  .filter_on_restaurant_type(filters[:filters_id]['place_type'])
    markers = []
    places.each do |place|
      marker = {}
      marker[:lat] = place.lonlat.y
      marker[:lng] = place.lonlat.x
      marker[:name] = place.name.titleize
      marker[:infowindow] = custom_infowindow(place)
      markers << marker
    end
    ActionCable.server.broadcast('place', markers)
  end

  private

  def custom_infowindow(place)
    infowindow = if !place.website.blank?
                   "<b> <a href='#{place.website}' target=_blank> #{place.name.titleize} </a> </b>"
                 else
                   "<b>#{place.name}</b>"
                 end

    infowindow += '<br>'
    place.place_types.each do |place_type|
      infowindow += "<i> #{place_type.name.titleize}</i>"
      infowindow += ', ' unless place_type == place.place_types.last
    end
    infowindow += "<br> #{place.street.name} <br> #{place.street.zipcode.name} #{place.street.zipcode.city.name.titleize}"

    unless place.map_link.blank?
      infowindow += "<br> <a href='#{place.map_link}' target=_blank> Maps link </a>"
    end

    infowindow += if place.reviews.count > 1
                    '<br> <br> Reviews : <ul>'
                  else
                    '<br> <br> Review : <ul>'
                  end

    place.reviews.each do |review|
      infowindow += "<li> <a href='#{review.link}' target=_blank> #{review.website.name.titleize} </a> </li>"
    end
    infowindow += '</ul>'
    infowindow
  end
end
