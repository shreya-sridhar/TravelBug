class ActivitiesController < ApplicationController
    def show 
        @activity = Activity.find(params[:id])
        @user = User.all.sample
        @trip = @user.trips.sample
        @destination = @trip.destination.id

        @likes = @activity.likes_count
        @dislikes = @activity.dislikes_count
    end 

    def index 
        @activities = Activity.all
    end

    def addactivities
        # if destination == 'destination'
        #     if action == 'add'
        #         @iter[destination] = []    
        #     else
        #         @iter.delete(destination)
        #     end 
        # end
        # else 
        #     if action == 'add' 
        #         iter['activities'] = []
        #         iter['activities'] << activity 
        #     else
        #         iter['acti']
        #     end 
        # end
        
        trip_id = params[:trip].to_i
        @trip = Trip.find(params[:trip])
        @activity = Activity.find(params[:activity])
        @user = User.all.sample
        if @trip.activities == nil 
            # @trip.activities == @activity.name
            # @trip.save
            @trip.update_attribute(:activities, @activity.name)
            @trip.update_attribute(:expense, @activity.price)
        else
            @activities = @trip.activities + " " + @activity.name 
            @trip.update_attribute(:activities, @activities )
            @expense = @trip.expense + @activity.price 
            @trip.update_attribute(:expense, @expense)
        end
        redirect_to user_trip_path(user_id: @user.id, id: @trip.id)
    end
end


