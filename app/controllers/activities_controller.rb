class ActivitiesController < ApplicationController
    def show
        @place = params["value"][0]
        if @place.include?("source")
            @img_url = @place["source"]
        end
        @text = @place["text"]
        @title = @place["title"].split(":")[1]
        @name = @place["name"]
        # "road"=>"Yeniçeriler Caddesi", "town"=>"Fatih", "state"=>"Marmara Bölgesi", "suburb"=>"Beyazıt Mahallesi", "country"=>"Türkiye", "postcode"=>"34126", "country_code"=>"tr",
        @address = "nill"
        # @place["road"]+" , "+@place["town"]+" , "+@place["suburb"]+" , "+@place["state"]+" , "+@place["country"]+" , "+@place["postcode"] 
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


