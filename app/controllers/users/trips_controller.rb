class Users::TripsController < ApplicationController
    before_action :find_trip, only: [:edit, :itinerary]

    def show
        @user = User.find(params[:user_id].to_i)
        @trip = Trip.find(params[:id].to_i)
        if params[:destination]
            @destination = Destination.find(params[:destination_id].to_i)
            @trip.destination = @destination
        end 
        #redirect_to user_trip_path(user_id: @user.id, trip_id: @trip.id, activity_array: @activity_array)
    end

    def index 
        @user = User.find(params[:user_id])
        @trips = Trip.all
    end 


    def new
        @user = User.find(params[:user_id])
        @trip = @user.trips.new
        @users = User.all
        @destinations = Destination.all
    end 

    def create
        @user = User.find(params[:user_id])
        @trip = @user.trips.create(trips_params)
        @trip.destination = nil
        @user_id = trips_params[:user_id]
        @destinations = Destination.all
        redirect_to destinations_path(user_id:@user.id,trip_id:@trip.id)
    end

    def edit
    end

    def destroy
        @trip = @user.trips.find(params[:id])
        @trip.destroy
        render user_trips_path(@user)
    end

private

    def find_trip
        @trip = @user.trips.find(params[:id])
    end

    def trips_params
        params.require(:trip).permit(:user_id, :end_date, :start_date, :num_of_people, :traveller_names, :budget, :destination_id,:activity,:id)
    end
    
end