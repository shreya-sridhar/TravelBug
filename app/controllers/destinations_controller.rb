class DestinationsController < ApplicationController
    def show 
        @destination = Destination.find(params[:id])
        @booked = @destination.sum{ |des| des.booked }
        @featured = @destination.max{ |max| max.booked }
    end

    def index 
        @destinations = Destination.all 
    end
end
