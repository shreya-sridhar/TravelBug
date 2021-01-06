class CountriesController < ApplicationController
    def show 
        @destinations = Destination.find_by(country: params[:name])
        @country = params[:name]
    end 

    def index 
        @countries = Destination.countries
    end

end