class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login,  :only => [:create, :new]

    def show
        @user_id = @user.id
        @session = 1
        session[:city] = params[:city]
        if session[:city]
            @destinations = Destination.where("location LIKE ?", "%#{session[:city].titleize}%")
            @session = nil
        else
            @destinations = Destination.all.sort_by{|d| d.location}
        end
        @countries = []
        @destinations.each do |d|
            @countries << d.country 
        end
    end

    def handle_city
        if session[:city]
          @destinations = Destination.where("location LIKE ?", "%#{session[:city].titleize}%")
        else
          @destinations = Destination.all
        end
    end    

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(users_params)
        login_user(@user.id)

        if @user.valid?
            redirect_to @user
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path

            #ask about whether you go to the new user or new login
        end
    end

    def edit
    end

    def update
        byebug
        if params[:user][:activity_id].to_i == 0
            redirect_to @user
        else 
            @activity = Activity.find(params[:user][:activity_id])
            @like = Like.where(activity_id: @activity.id, user_id: @user.id)
            @trip = Trip.find(params[:user][:trip_id])
            if @like 
                byebug
                new_like = Like.new
                new_like = Like.create(activity_id: @activity.id, user_id: @user.id)
                new_like.save 
            else 
                Like.find(@like.id).destroy
            end
        end 
    end

    def destroy
        byebug
        @user.destroy
        redirect_to root_path
    end
    
    def stats
    end
private

    def find_user
        @user = User.find(params[:id])
    end

    def users_params
        params.require(:user).permit(:name, :age, :hometown, :username, :password)
    end

end


