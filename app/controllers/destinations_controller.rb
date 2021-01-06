class DestinationsController < ApplicationController
    def show
        @destination = Destination.find(params[:id])
        @trip = Trip.find(params[:trip_id].to_i)
        @user = User.find(params[:user_id].to_i)
    end

    def index
        @destinations = Destination.all
        @trip = Trip.find(params[:trip_id].to_i)
        @user = User.find(params[:user_id].to_i)
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



