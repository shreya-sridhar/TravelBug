require 'net/http'
require 'open-uri'
require 'json'
class Getdatum < ApplicationRecord

  def self.get_place_data(lat,lon,type)
    url = "https://api.opentripmap.com/0.1/en/places/radius?radius=10000&lon=" + lon.to_s + "&lat="+lat.to_s+"&kinds="+type+"&rate=3&format=json&apikey=5ae2e3f221c38a28845f05b616ae2d304541d9f690f8d882b9ee73f4"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def address(destination)
    [destination.city,destination.country].compact.join(', ')
  end

  def self.get_xid_data(xid)
    url = "https://api.opentripmap.com/0.1/en/places/xid/"+xid+"?apikey=5ae2e3f221c38a28845f05b616ae2d304541d9f690f8d882b9ee73f4"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
  end
  

  def self.get_places(lat,lon,type)
        place = {}
        place_hash = {}
        # we use the JSON library to parse the API response into nicely formatted JSON
        places = JSON.parse(self.get_place_data(lat,lon,type))
        places.each do |res|
            place_hash[res["name"]]=res["xid"]
        end
        place_image = {}
        place_text = {}
        place_title = {}
        place_address = {}
        place_hash.each do |res|
          x =JSON.parse(self.get_xid_data(res[1]))
          place_image[x["name"]] = x["preview"]
          place_address[x["name"]] = x["address"]
          place_text[x["name"]] = x["wikipedia_extracts"]
          place[x["name"]] = [x["preview"],x["address"],x["wikipedia_extracts"]]
        end
        return place
  end 

  def self.get_destination_image_data(destination)
    if destination.location
      url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input="+destination.location+",%20"+destination.country+"+&key=AIzaSyC0UZckU_eK8heofiWpXTUYU-IpJo0KhnI&inputtype=textquery&fields=name,photos"
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      response.body
    end
  end

  def self.get_photo(destination)
    dest_image = JSON.parse(self.get_destination_image_data(destination))
    photo_ref = dest_image["candidates"][0]["photos"][0]["photo_reference"]
    x = self.dest_images(photo_ref)
    y = Nokogiri::HTML.parse(x)
    image_url = y.xpath('//a/@href')[0].value
    return image_url
  end

  def self.dest_images(photo_ref)
    url = "https://maps.googleapis.com/maps/api/place/photo?photoreference="+photo_ref+"&key=AIzaSyC0UZckU_eK8heofiWpXTUYU-IpJo0KhnI&maxwidth=400&maxheight=400"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
  end


end

