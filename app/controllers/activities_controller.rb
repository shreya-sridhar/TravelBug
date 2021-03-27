class ActivitiesController < ApplicationController
    def show
        @place = params["value"][0]
        if @place.include?("source")
            @img_url = @place["source"]
        end
        @text = @place["text"]
        @title = @place["title"].split(":")[1]
        @name = @place["name"]? @place["name"] : ""
        @road = @place["road"]? @place["road"] : ""
        @house = @place["house"]? @place["house"] : ""
        @county = @place["county"]? @place["county"] : ""
        @town = @place["town"]? @place["town"] : ""
        @state = @place["state"]? @place["state"] : ""
        @suburb = @place["suburb"]? @place["suburb"] : ""
        @country = @place["country"]? @place["country"] : ""
        @postcode = @place["postcode"]? @place["postcode"] : ""
        @address = @house + ", "+ @road +", "+ @town +", " + @state +", "+ @county +", "+ @suburb +", "+ @country+", " + @postcode
        results = Geocoder.search(@house + ", "+ @road +", "+ @town +", " + @state +", "+ @county +", "+ @suburb +", "+ @country)
        @lat = results.first.coordinates[0]
        @lng = results.first.coordinates[1]
    end 

    def index 
        @trip = Trip.find(params[:id])
        @destination = @trip.destination
        @type = params[:type]
        @places = Getdatum.get_places(@destination.lat,@destination.lon,@type)
    end

    def addactivities
        @trip = Trip.find(params[:trip].to_i)
        @activity = Activity.find(params[:activity].to_i)
        @user = @trip.user
        if @trip.activities == nil 
            # @trip.activities == @activity.name
            # @trip.save
            @trip.update_attribute(:activities, @activity.id.to_s)
        else
            @activities = @trip.activities + " " + @activity.id.to_s
            @trip.update_attribute(:activities, @activities )
        end
        redirect_to user_trip_path(@user,@trip)
    end
end

