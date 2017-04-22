module DataLoader
  def load_csv(csv_file)
    require 'csv'
    require 'gmaps_api'
    include GmapsAPI
    CSV.foreach(csv_file, headers: true) do |row|
      country = Country.find_or_create_by(name: row['Pays'])
      city = City.find_or_create_by(name: row['Ville'], country: country)
      zipcode = Zipcode.find_or_create_by(name: row['Zipcode'], city: city)
      street = Street.find_or_create_by(name: row['Adresse'], zipcode: zipcode)

      place_types = []
      unless row['Type_place_1'].blank?
        place_types << PlaceType.find_or_create_by(name: row['Type_place_1'])
      end

      unless row['Type_place_2'].blank?
        place_types << PlaceType.find_or_create_by(name: row['Type_place_2'])
      end

      unless row['Type_place_3'].blank?
        place_types << PlaceType.find_or_create_by(name: row['Type_place_3'])
      end

      unless row['Type_place_4'].blank?
        place_types << PlaceType.find_or_create_by(name: row['Type_place_4'])
      end

      place = Place.find_or_initialize_by(name: row['Nom'])
      place.update(lonlat: coordinates("#{row['Nom']} #{row['Adresse']} #{row['Zipcode']} #{row['Ville']}"),
                   map_link: row['Lien_google_maps'],
                   street: street,
                   website: row['Lien_site'])
      place.save
      place_types.each do |place_type|
        PlacePlaceType.find_or_create_by(place: place, place_type: place_type)
      end
      website = Website.find_or_create_by(name: row['Site_review'])

      Review.find_or_create_by(link: row['Lien_review'], website: website, place: place)
    end
  end
end
