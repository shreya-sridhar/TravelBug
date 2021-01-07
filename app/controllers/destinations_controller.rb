class DestinationsController < ApplicationController
    def show
        @trip = Trip.find(params[:trip_id].to_i)
        @user = @trip.user
        @destination = Destination.find(params[:id].to_i)
        # @destination = @trip.destination 
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
        redirect_to user_trip_path(user_id: @user.id, id: @trip.id)
    end

end



