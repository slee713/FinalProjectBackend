class Api::V1::HikingTripsController < ApplicationController
    def index
    end

    def create 
        hiking_trip = HikingTrip.new(hiking_trip_params)

        if hiking_trip.valid?
            hiking_trip.save
            user_hikes = User.create(user: @user, hiking_trip: hiking_trip)
            render json: hiking_trip, includes [:users => {except: [:created_at, :updated_at]}]
        else 
            render json: {error: hiking_trip.errors.full_messages.join(';')}   
        end    
    end


    def hiking_trip_params
        params.permit(:hiking_project_id, :name, :start_date, :end_date, :description)
    end
end
