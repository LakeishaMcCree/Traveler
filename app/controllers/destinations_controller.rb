class DestinationsController < ApplicationController
    before_action :require_login

    def index
        find_user
        @destinations = @user.destinations.all 
    end

    def show
        find_user
        find_destination
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
        if @destination.save
            redirect_to user_destinations_path(@user), :flash => { :success => "You've successfully added this trip." }
        else  
            render :new
        end
    end

    def edit
        set_user
        find_destination    
        if @destination.user != current_user
            redirect_to user_destinations_path(@user), :flash => { :error => "You are not allowed to edit another traveler's trip." }
        end
    end

    def update
        set_user
        find_destination
        if @destination.update(destination_params)
            redirect_to user_destinations_path(@user), :flash => { :success => "Your trip has been updated!" }
        else
            render :edit
        end
    end

    def destroy
        set_user
        find_destination
        @destination.destroy
        redirect_to user_destinations_path(@user), :flash => { :success => "Your trip has been deleted." }
    end

    private
    def find_user
        @user = User.find_by_id(params[:user_id])
    end

    def find_destination
        @destination = Destination.find_by_id(params[:id])
    end

    def find_city
        @city = City.find_by_id(params[:city_id])
    end

    def destination_params
        params.require(:destination).permit(:user_id, :city_id, :rating, :fave_attraction, :comment, city_attributes:[:city, :country, :country_id])
    end

end
