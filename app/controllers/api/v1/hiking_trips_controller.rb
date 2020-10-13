class Api::V1::HikingTripsController < ApplicationController
    def index
        hiking_trips = @user.hiking_trips
        render json: hiking_trips, except: [:created_at, :updated_at],
                                include: [
                                    :users => {except: [:password_digest, :created_at, :updated_at]}, 
                                    :stops => {except: [:created_at, :updated_at]}, 
                                    :group_gear_items  => {except: [:created_at, :updated_at]}
                                ]
    end

    def show
        hiking_trip = HikingTrip.find(params[:id])
        render json: hiking_trip, include: [
                                        :users => {except: [:password_digest, :created_at, :updated_at]}, 
                                        :stops => {except: [:created_at, :updated_at]}, 
                                        :group_gear_items  => {except: [:created_at, :updated_at]}
                                    ]
    end

    def create 
        hiking_trip = HikingTrip.new(hiking_trip_params)

        if hiking_trip.valid?
            hiking_trip.save
            user_hike = UserHike.create(user: @user, hiking_trip: hiking_trip)
            render json: hiking_trip, include: [
                                            :users => {except: [:created_at, :updated_at]}, 
                                            :stops => {except: [:created_at, :updated_at]}, 
                                            :group_gear_items => {except: [:created_at, :updated_at]}
                                        ]
        else 
            render json: {error: hiking_trip.errors.full_messages.join(';')}   
        end    
    end

    def update
        hiking_trip = HikingTrip.find(params[:id])
        hiking_trip.assign_attributes(hiking_trip_params)

        if hiking_trip.valid?
            hiking_trip.save
            render json: hiking_trip, include: [
                                            :users => {except: [:created_at, :updated_at]}, 
                                            :stops => {except: [:created_at, :updated_at]}, 
                                            :group_gear_items => {except: [:created_at, :updated_at]}
                                        ]
        else 
            render json: {error: hiking_trip.errors.full_messages.join(';')}
        end
    end


    def hiking_trip_params
        params.permit(:hiking_project_id, :name, :start_date, :end_date, :description)
    end
end
