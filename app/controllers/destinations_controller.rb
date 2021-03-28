class DestinationsController < ApplicationController
    def show
        @trip = Trip.find(params[:trip_id].to_i)
        @user = @trip.user
        @destination = Destination.find(params[:id].to_i)
        # @destination = @trip.destination 
        url = "https://pixabay.com/api/videos/?key=20881751-dd7fb42383b27ec4a1d57dca8&q=#{@destination.location}&pretty=true&page=1&per_page=3&safesearch=true"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
        @video1 = JSON.parse(response.body)["hits"][0]["videos"]["medium"]["url"]
        @video2 = JSON.parse(response.body)["hits"][1]["videos"]["medium"]["url"]
        @video3 = JSON.parse(response.body)["hits"][2]["videos"]["medium"]["url"]
    end

    def index
        @trip = Trip.find(params[:trip_id].to_i)
        @user = @trip.user
        @destinations = Destination.all.map{|dest| dest if dest.country == @trip.destination.country}.compact
    end

    def adddestination
        @destination = Destination.find(params[:destination].to_i)
        @trip = Trip.find(params[:trip].to_i)
        @user = @trip.user
        @trip.update_attribute(:destination_id, @destination.id)
        # redirect_to user_trip_path(user_id: @user.id, id: @trip.id,destination_id: @destination.id)
        redirect_to user_trip_path(user_id: @user.id, id: @trip.id)
    end


end



