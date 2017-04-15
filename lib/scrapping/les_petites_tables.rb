module Scrapping
  def les_petites_tables
    require 'mechanize'
    mechanize = Mechanize.new

    page = mechanize.get('https://www.lespetitestables.com/tous-nos-restos/')
    # link = page.link_with(text: 'Random article')
    debugger
    page.search(".container-isotope a").each do |link|
      debugger
      page2 = mechanize.get(link.values[0])
      name = page2.search('.row p')[8].children[0].text
      street = page2.search('.row p')[8].children[2].text
      zipcode = page2.search('.row p')[8].children[4].text.split(" ")[0]
      city = page2.search('.row p')[8].children[4].text.split(" ")[0]
      country = france
      link = page2.search('.row p')[8].children[9].values[0]

    end
    puts page.title

  end
end