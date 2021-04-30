class ApplicationController < ActionController::Base
    before_action :find_user
    before_action :require_login 

    def find_user
    # if logged_in is true, it gets saved to @logged_in variable, if user is logged in save that current user to @user variable 
        @logged_in = logged_in?
        @user = User.find(current_user_id) if logged_in?
    end 

    def require_login
    # check to see if user is 100% logged in, if not they will be redirected to new login path
        unless logged_in?
            redirect_to new_login_path
        end 
    end 

    def login_user(user_id)
        session[:user_id] = user_id
    end 


    def current_user_id
    # checks to see if anything in sessions
        session[:user_id]
    end 

    def logged_in?
    # if sessions exists double bang changes current_user_id value to true if nil, double bang changes value to falsey
        !!current_user_id
    end 

    def logout_user
    # takes session( a hash ) and calls delete on it, it deletes the :user_id key
        session.delete(:user_id)
        flash[:errors]  = ["User successfully logged out"]
        redirect_to new_login_path
    end 

    def page_not_found
        respond_to do |format|
          format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
          format.all  { render nothing: true, status: 404 }
        end
    end
    
    def server_error
        respond_to do |format|
            format.html { render template: 'errors/internal_server_error', layout: 'layouts/error', status: 500 }
            format.all  { render nothing: true, status: 500}
        end
    end
end

