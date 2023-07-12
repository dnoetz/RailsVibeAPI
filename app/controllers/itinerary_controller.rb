class ItineraryController < ApplicationController
    before_action :authenticate_user!

    def index
        @itinerary = current_user.itineraries.where.not(archived: true).order(:position)

        render json: @itinerary
    end

    def update
        itinerary_params.each do |itinerary_params|
            itinerary = Itinerary.find(itinerary_params[:id])
            itinerary.update(position: itinerary_params[:position].to_i)
        end
        head :no_content
    end

    def archived
        @itinerary = current_user.itineraries.where(archived: true)

        render json: @itinerary
    end

    def create
        @itinerary = current_user.itineraries.build(itinerary_params)

        if @itinerary.save
            render json: @itinerary
        else
            render json: { error: 'Unable to create itinerary.' }
        end
    end

    def remove
        @itinerary = current_user.itineraries.find(params[:id])

        if @itinerary.update(archived: true)
            render json: { message: 'Itinerary removed.' }
        else
            render json: { error: 'Unable to remove itinerary.' }
        end
    end

    private

    def itinerary_params
        params.require(:itinerary).permit(:id, :name, :description, :location, :position, :archived)
    end
end
