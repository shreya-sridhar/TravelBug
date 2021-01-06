class ActivitiesController < ApplicationController
    def show 
        @activity = Activity.find(params[:id])
        @likes = @activity.likes_count
        @dislikes = @activity.dislikes_count
    end 

    def index 
        @activities = Activity.all
    end 

end
