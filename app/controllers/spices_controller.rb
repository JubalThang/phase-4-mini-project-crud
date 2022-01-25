class SpicesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index 
        render json: Spice.all
    end

    def create 
        spice = Spice.create(filter_params)
        render json: spice, status: :created
    end

    def update 
        spice = spice_search
        spice.update(filter_params)
        render json: spice
    end


    def destroy 
        spice = spice_search
        spice.destroy
        head :no_content
    end

    private 
    def filter_params 
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def spice_search
        Spice.find(params[:id])
    end

    def render_not_found 
        render json: {"error": "Item not found!"}
    end

end
