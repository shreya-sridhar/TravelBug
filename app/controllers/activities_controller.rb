class ActivitiesController < ApplicationController

    @@mapping = {}

    def show     
        byebug 
        if params[:id].to_i != 0
            byebug
            @activity = Activity.find(params[:id])
            @trip = Trip.find(params[:format])
        else
            byebug
            @trips = Trip.all
            @trip = Trip.find(params[:trip_id])
            @trip_id = params[:trip_id]
            @title = params["value"][0]["title"]
            @activity = Activity.find_by(title: @title)
        end
    end 

    def index 
        @trip = Trip.find(params[:id])
        @destination = @trip.destination
        @type = params[:type] 
        if @@mapping.key?(@destination.location+"-"+@type)
            @places = @@mapping[@destination.location+"-"+@type]
        else 
            @places = Getdatum.get_places(@destination.lat,@destination.lon,@type)
            @places.each do |place,value|
                @img_url = value[0]["source"]
                @text = value[2]["text"]
                @title = value[2]["title"]
                @house = value[1]["house"] || ""
                @road = value[1]["road"] || ""
                @town = value[1]["town"] || ""
                @state = value[1]["state"] || ""
                @county = value[1]["county"] || ""
                @suburb = value[1]["suburb"] || ""
                @country = value[1]["country"] || ""
                @postcode = value[1]["postcode"] || ""
                @address = @house + ", "+ @road +", "+ @town +", " + @state +", "+ @county +", "+ @suburb +", "+ @country+", " + @postcode
                results = Geocoder.search(@house + ", "+ @road +", "+ @town +", " + @state +", "+ @county +", "+ @suburb +", "+ @country)
                if results.first
                    @lat = results.first.coordinates[0]
                    @lng = results.first.coordinates[1]
                end 
                @search_activity = Activity.find_by(address: @address)
                if !@search_activity
                    @activity = Activity.new 
                    @activity = Activity.create(title: @title, img_url: @img_url,text: @text, address: @address, lat: @lat, lng: @lng) 
                    @activity.trip_id = 1
                    @activity.save 
                    @dest_act = DestinationActivity.new
                    @dest_act = DestinationActivity.create(destination_id: @destination.id, activity_id: @activity.id)
                end 
            end
            @@mapping[@destination.location+"-"+@type] = @places 
        end
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

