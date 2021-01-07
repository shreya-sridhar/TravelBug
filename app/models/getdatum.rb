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

  def self.get_destination_image_data(destination)
    url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input="+destination.location+",%20"+destination.country+"+&key=AIzaSyC0UZckU_eK8heofiWpXTUYU-IpJo0KhnI&inputtype=textquery&fields=name,photos"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def self.get_photo(destination)
    dest_image = JSON.parse(self.get_destination_image_data(destination))
    photo_ref = dest_image["candidates"][0]["photos"][0]["photo_reference"]
    x = self.dest_images(photo_ref)
    byebug
    
    # y = x.split("<HTML><HEAD><meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">\n<TITLE>302 Moved</TITLE></HEAD><BODY>\n<H1>302 Moved</H1>\nThe document has moved\n<A HREF=\")"
    
  end

  def self.dest_images(photo_ref)
    url = "https://maps.googleapis.com/maps/api/place/photo?photoreference="+photo_ref+"&key=AIzaSyC0UZckU_eK8heofiWpXTUYU-IpJo0KhnI&maxwidth=400&maxheight=400"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
  end


end
