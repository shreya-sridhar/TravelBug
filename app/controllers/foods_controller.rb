class FoodsController < ApplicationController
    def show 
        @food = Food.find(params[:id])
    end 

    def index 
        @foods = Food.all
    end
end
