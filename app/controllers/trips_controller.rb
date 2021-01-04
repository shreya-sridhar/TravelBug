class TripsController < ApplicationController
    before_action :find_trip, only: [:show, :edit]

    def index 
        @trips = Trip.all
    end 

    def show
    end 

    def new
        @trip = Trip.new
        @users = User.all
        @destinations = Destination.all
    end 

    def create
        @trip = Trip.create(trips_params)
        redirect_to @trip
    end

    def edit
    end

private

    def find_trip
        @trip = Trip.find(params[:id])
    end

    def trips_params
        params.require(:trip).permit(:date, :num_of_people, :traveller_names, :budget, :user_id, :destination_id)
    end
end
