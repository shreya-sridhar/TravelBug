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
        if @user.valid?
            redirect_to @user
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to @new_user_path
    end

    def edit
    end

    def update
        @user.update(users_params)
        redirect_to @user
    end

    def destroy
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
