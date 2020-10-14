class Api::V1::StopsController < ApplicationController
    def create
        hiking_trip= HikingTrip.find(params[:hiking_trip_id])
        if hiking_trip.stops.find_by(stop: params[:stop])
            render json: {error: "Stop Cant Be Created With the Same Number"}
        else 
            stop = Stop.new(stop_params)
        
        
            if stop.valid?
                stop.save
                render json: stop,  except: [:updated_at, :created_at]
            else
                render json: {error: stop.errors.full_messages.join(';')}
            end
        end
    end

    def update
        stop = Stop.find(params[:id])
        stop.assign_attributes(stop_params)

        if stop.valid?
            stop.save
            render json: stop,  except: [:updated_at, :created_at]
        else 
            render json: {error: stop.errors.full_messages.join(';')}
        end
    end

    def destroy
        stop = Stop.find(params[:id])
        stop.destroy
    end


    private 

    def stop_params
        params.permit(:hiking_trip_id, :stop, :name, :elevation, :distance, :notes)
    end
end
