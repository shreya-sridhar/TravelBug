class WelcomeController < ApplicationController
    skip_before_action :find_user,  :only => [:home]
    skip_before_action :require_login, :only => [:home]

    def home
    end
end