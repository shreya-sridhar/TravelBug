class WelcomeController < ApplicationController
    skip_before_action :find_user,  :only => [:home]

    def home
    end
end