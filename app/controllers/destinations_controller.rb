class DestinationsController < ApplicationController
    before_action :require_login

    def index
        find_user
        @destinations = @user.destinations.all 
    end

    def show
        find_user
        find_trip
    end

    def five_star
        set_user
    end

    def new
        set_user
        find_city
        @destination = Destination.new 
    end

    def create 
        set_user 
        find_destination
        @destination = @user.destinations.build(destination_params)
        if destination.save
            redirect_to user_destinations_path(@user), :flash => { :success => "You've successfully added this trip. "}
        else  
            render :new
        end
    end




end
