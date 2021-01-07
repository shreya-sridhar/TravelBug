class DestinationsController < ApplicationController
    def show
        @trip = Trip.find(params[:trip_id].to_i)
        @user = @trip.user
        @destination = @trip.destination 
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
        if @trip.destination == nil 
            @trip.update_attribute(:destination_id, @destination.id)
        end
        redirect_to user_trip_path(user_id: @user.id, id: @trip.id)
    end

end



