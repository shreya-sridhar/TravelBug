class LikesController < ApplicationController

    def show
        @activities = Activity.find(params[:id])
        @likes = @activity.likes_count
        @featured = @activity.max{ |max| max.likes }

        @dislikes = @activity.dislikes_count
        @featured = @activity.max{ |max| max.dislikes }
    end

    def create
        @likes = Like.create(likes_params)
        redirect_to @likes.activity
    end

private 

    def likes_params
        params.permit(:activity_id, :user_id, :emoji)
    end
end
