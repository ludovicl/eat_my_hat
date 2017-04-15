module GmapsAPI

  def coordinates(address)
    debugger
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{ENV['GOOGLE_API']}"
    response = RestClient.get(URI.encode(url))
    coordinates = JSON.parse(response, symbolize_names: true)[:results][0][:geometry][:location]
    "POINT( #{coordinates[:lng]} #{coordinates[:lat]} )"
  end

  def link(address)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{ENV['GOOGLE_API']}"
    response = RestClient.get(URI.encode(url))
    street = JSON.parse(response, symbolize_names: true)[:results][0][:formatted_address]
    "http://maps.google.com/?q=#{street.gsub!(' ', '+')}+#{address.gsub!(' ', '+')}"
  end

end
