class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def show 
    end

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(users_params)
        redirect_to @user
    end

    def edit
    end

    def update
        @user.update(users_params)
        redirect_to @user
    end

    def destroy
    byebug
        @user.destroy
        redirect_to root_path
    end

private

    def find_user
        @user = User.find(params[:id])
    end

    def users_params
        params.require(:user).permit(:name, :age, :hometown)
    end
end
