require 'net/http'
require 'open-uri'
require 'json'

class Getdatum < ApplicationRecord

  def self.get_restaurant_data(lat,lon)
    url = "https://api.opentripmap.com/0.1/en/places/radius?radius=10000&lon=" + lon + "&lat="+lat+"&kinds=restaurants&rate=3&format=json&apikey=5ae2e3f221c38a28845f05b616ae2d304541d9f690f8d882b9ee73f4"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def self.get_xid_data(xid)
    url = "https://api.opentripmap.com/0.1/en/places/xid/"+xid+"?apikey=5ae2e3f221c38a28845f05b616ae2d304541d9f690f8d882b9ee73f4"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def self.get_restaurants(lat,lon)
        restaurant_hash = {}
        # we use the JSON library to parse the API response into nicely formatted JSON
        restaurants = JSON.parse(self.get_restaurant_data(lat,lon))
        restaurants.each do |res|
            restaurant_hash[res["name"]]=res["xid"]
        end
        restaurant_image = {}
        restaurant_hash.each do |res|
            restaurant_image[name] = JSON.parse(self.get_xid_data(res[1]))["preview"]["source"]
        end
        return restaurant_image
  end 

end
