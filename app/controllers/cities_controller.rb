class CitiesController < ApplicationController

    before_action :require_login
    
    def index
        @cities = City.all.order(:name)
    end

    def show
        @city = City.find(params[:id])
    end

    def most_visited
        @city = City.most_visited.first
    end

    def highly_rated
        @cities = City.highly_rated
    end

    def new
        @city = City.new
    end

    def create
        @city = City.create(city_params)
        if @city.save
            redirect_to cities_path, :flash => { :success => "You've added this city!" }
        else
            render :new
        end
    end

    private
    def city_params
        params.require(:city).permit(:name, :country_id, country_name:[:country])
    end
end
