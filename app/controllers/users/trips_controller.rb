require 'net/http'
require 'open-uri'
require 'json'

class Users::TripsController < ApplicationController
    before_action :find_trip, only: [:edit, :itinerary]

    def show
        @user = User.find(params[:user_id].to_i)
        @trip = Trip.find(params[:id].to_i)
        if params[:destination]
            @destination = Destination.find(params[:destination_id].to_i)
            @trip.destination = @destination
        end
    end

    def index 
        @user = User.find(params[:user_id])
        @trips = @user.trips
        if @trips.length == 0
            flash[:errors] = ["No trips to view. Please click on New Trip to create one."]
            redirect_to user_path(@user)
        end
    end 

    def new
        @user = User.find(params[:user_id])
        @trip = @user.trips.new
        @users = User.all
        @destinations = Destination.all
        @destination = Destination.find(params[:destination_id])
        url = "https://pixabay.com/api/?key=20881751-dd7fb42383b27ec4a1d57dca8&q=#{@destination.location}&image_type=photo&pretty=true&safesearch=true&page=1&per_page=6"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
        @image1 = JSON.parse(response.body)["hits"][0]["largeImageURL"]
        @image2 = JSON.parse(response.body)["hits"][1]["largeImageURL"]
        @image3 = JSON.parse(response.body)["hits"][2]["largeImageURL"]
        @image4 = JSON.parse(response.body)["hits"][3]["largeImageURL"]
        @image5 = JSON.parse(response.body)["hits"][4]["largeImageURL"]
        @image6 = JSON.parse(response.body)["hits"][5]["largeImageURL"]
    end 

    def create
        @destination = Destination.find(params["trip"]["destination_id"].to_i)
        @user = User.find(params[:user_id].to_i)
        @trip = Trip.create(start_date: trips_params[:start_date],end_date: trips_params[:end_date],num_of_people: trips_params[:num_of_people], traveller_names: trips_params[:traveller_names], budget:trips_params[:budget],user_id:@user.id, destination_id:@destination.id)
        @trip.save
        redirect_to destination_path(@destination.id,{user_id:@user.id,trip_id:@trip.id})

        # @user = User.find(params[:user_id])
        # @trip = @user.trips.create(trips_params)
        # @user_id = trips_params[:user_id]
        # @destinations = Destination.all

        # if @trip.valid?
        #     redirect_to destinations_path(user_id: @user.id, trip_id: @trip.id)
        # else
        #     flash[:errors] = @trip.errors.full_messages
        #     redirect_to new_user_trip_path(@user)
        # end
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
