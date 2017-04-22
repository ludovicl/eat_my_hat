module Scrapping
  def les_petites_tables
    require 'mechanize'
    require 'data_loader/import_new_places'
    include DataLoader
    mechanize = Mechanize.new
    data = []

    #   { place_name: "Place name",
    #     place_link: "Website place link",
    #     place_gmaps_link: "Google maps link",
    #     place_address: "Place address",
    #     place_zipcode: "Zipcode place",
    #     place_city: "City place",
    #     place_country: "Country place",
    #     place_types: ["Place type 1", "Place type 2"]
    #     review_link: "Website review link",
    #     review_website_name: "Website review name",
    #   }
    # ]
    page = mechanize.get('https://www.lespetitestables.com/tous-nos-restos/')
    # link = page.link_with(text: 'Random article')
    index = 0
    page.search('.container-isotope a').each do |link|
      datum = {}
      begin
        page2 = mechanize.get(link.values[0])
        datum[:place_name] = page2.search('.row p')[8].children[0].text.strip.downcase
        datum[:place_street] = page2.search('.row p')[8].children[2].text.strip.downcase
        datum[:place_zipcode] = page2.search('.row p')[8].children[4].text.split(' ')[0].strip.downcase
        datum[:place_city] = page2.search('.row p')[8].children[4].text.split(' ')[1].strip.downcase
        datum[:place_country] = 'france'
        datum[:place_link] = page2.search('.row p')[8].children[9].values[0].strip.downcase
        datum[:review_link] = page2.uri.to_s.strip.downcase
        datum[:review_website_name] = 'les petites tables'
        data << datum
        index += 1
      rescue
        nil
      end
      break if index > 10
    end
    import_new_places data.to_json
  end
end
