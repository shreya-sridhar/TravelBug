class LikesController < ApplicationController

    def show
        redirect_to activity_path
    end

    def index 
        @likes = Like.where(user_id: @user.id) 
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

