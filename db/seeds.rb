# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'gmaps_api'
include GmapsAPI
country = Country.find_or_create_by(name: 'france')
city = City.find_or_create_by(name: 'paris', country: country)
zipcode = Zipcode.find_or_create_by(name: '75009', city: city)
street = Street.find_or_create_by(name: '69 rue de Provence', zipcode: zipcode)
restaurant = PlaceType.find_or_create_by(name: 'restaurant')
portugais = PlaceType.find_or_create_by(name: 'portugais')
place = Place.find_or_create_by(name: 'Café nata', street: street,
                                lonlat: coordinates("Cafe nata 69 rue de Provence 75009 paris"),
                                map_link: "https://goo.gl/maps/e3PqMN5hBv52")
PlacePlaceType.find_or_create_by(place: place, place_type: portugais)
PlacePlaceType.find_or_create_by(place: place, place_type: restaurant)
website = Website.find_or_create_by(name: 'les petites tables', link: 'https://www.lespetitestables.com')
review = Review.find_or_create_by(link: 'https://www.lespetitestables.com/restaurant/cafe-nata-paris-75009/', name: '',
                                  website: website, place: place)

country = Country.find_or_create_by(name: 'france')
city = City.find_or_create_by(name: 'paris', country: country)
zipcode = Zipcode.find_or_create_by(name: '75010', city: city)
street = Street.find_or_create_by(name: '7 rue du Faubourg Saint-Martin', zipcode: zipcode)
restaurant = PlaceType.find_or_create_by(name: 'restaurant')
indian = PlaceType.find_or_create_by(name: 'indian')
place = Place.find_or_create_by(name: 'Elaichi Vegetarian Street Food', street: street,
                                lonlat: coordinates("Elaichi Vegetarian Street Food 7 rue du Faubourg Saint-Martin 75010 paris"),
                                map_link: "https://goo.gl/maps/MBWRbi9wUZ12")
PlacePlaceType.find_or_create_by(place: place, place_type: indian)
PlacePlaceType.find_or_create_by(place: place, place_type: restaurant)
website = Website.find_or_create_by(name: 'les petites tables', link: 'https://www.lespetitestables.com')
review = Review.find_or_create_by(link: 'https://www.lespetitestables.com/restaurant/elaichi-vegetarian-street-food-paris-75010/', name: '',
                                  website: website, place: place)


country = Country.find_or_create_by(name: 'france')
city = City.find_or_create_by(name: 'paris', country: country)
zipcode = Zipcode.find_or_create_by(name: '75004', city: city)
street = Street.find_or_create_by(name: '25 rue du roi de sicile', zipcode: zipcode)
restaurant = PlaceType.find_or_create_by(name: 'restaurant')
israelien = PlaceType.find_or_create_by(name: 'israélien')
place = Place.find_or_create_by(name: 'Tavline', street: street,
                                lonlat: coordinates("Tavline 25 rue du roi de sicile 75004 paris"),
                                map_link: "https://goo.gl/maps/YZQNuSvd7dm")
PlacePlaceType.find_or_create_by(place: place, place_type: israelien)
PlacePlaceType.find_or_create_by(place: place, place_type: restaurant)
website = Website.find_or_create_by(name: 'timeout', link: 'https://www.timeout.f')
review = Review.find_or_create_by(link: 'https://www.timeout.fr/paris/restaurants/tavline/', name: '',
                                  website: website, place: place)
