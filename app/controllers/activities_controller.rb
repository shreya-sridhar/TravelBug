class ActivitiesController < ApplicationController
    def show 
        @activity = Activity.find(params[:id])
    end 

    def index 
        @activities = Activity.all
    end
end
