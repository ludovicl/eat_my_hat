module DataLoader
  ##
  # input :
  # [
  #   { place_name: "Place name",
  #     place_link: "Website place link",
  #     place_gmaps_link: "Google maps link",
  #     place_street: "Place address",
  #     place_zipcode: "Zipcode place",
  #     place_city: "City place",
  #     place_country: "Country place",
  #     place_types: ["Place type 1", "Place type 2"]
  #     review_link: "Website review link",
  #     review_website_name: "Website review name",
  #   }
  # ]
  ##
  def import_new_places(data)
    require 'gmaps_api'
    include GmapsAPI

    data = JSON.parse(data, symbolize_keys: true)
    data.each do |datum|
      country = Country.find_or_create_by(name: datum['place_country'])
      city = City.find_or_create_by(name: datum['place_city'], country: country)
      zipcode = Zipcode.find_or_create_by(name: datum['place_zipcode'], city: city)
      street = Street.find_or_create_by(name: datum['place_street'], zipcode: zipcode)

      place_types = []
      datum['place_types'] = [] if datum['place_types'].nil?
      datum['place_types'].each do |place_type|
        place_types << PlaceType.find_or_create_by(name: place_type)
      end
      place = Place.find_or_initialize_by(name: datum['place_name'])
      place_infos = "#{datum['place_name']} #{datum['place_address']} #{datum['place_zipcode']} #{datum['place_city']}"
      place.update(lonlat: coordinates(place_infos),
                   map_link: gmaps_link(place_infos),
                   street: street,
                   website: datum['place_link'])
      place.save
      place_types.each do |place_type|
        PlacePlaceType.find_or_create_by(place: place, place_type: place_type)
      end
      website = Website.find_or_create_by(name: datum['review_website_name'])

      Review.find_or_create_by(link: datum['review_link'], website: website, place: place)
    end
  end
end
