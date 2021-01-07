class LoginController < ApplicationController
    skip_before_action :require_login,  :only => [:create, :new]
    skip_before_action :find_user,  :only => [:create, :new]
    # would this work for my welcome controller?

    def new
        @user = User.new
    end 

    def create
        @user = User.find_by(username:params[:username])
        if @user && @user.authenticate(params[:password])
            login_user(@user.id)
            redirect_to @user
        else 
            flash[:errors] = ["Incorrect Username or Password. Please try again."]
            redirect_to new_login_path
        end 
    end 

    def destroy
        logout_user
    end

end