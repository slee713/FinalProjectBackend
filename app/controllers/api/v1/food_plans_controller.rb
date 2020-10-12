class Api::V1::FoodPlansController < ApplicationController

    def create
        
        userHike = UserHike.find_by(user_id: @user.id, hiking_trip_id: params[:hiking_trip_id].to_i)
        
        foodPlan = FoodPlan.new(
            user_hike_id: userHike.id,
            day: params[:day],
            breakfast: params[:breakfast],
            lunch: params[:lunch],
            dinner: params[:dinner],
            snacks: params[:snacks],
            notes: params[:notes]
        )

        if foodPlan.valid?
            foodPlan.save
            render json: foodPlan
        else 
            render json: {error: foodPlan.errors.full_messages.join(';')}
        end
    end

    def update
        foodPlan = FoodPlan.find(params[:id])
        foodPlan.assign_attributes(params.permit(:day, :breakfast, :lunch, :dinner, :snacks, :notes))

        if foodPlan.valid?
            foodPlan.save
            render json: foodPlan
        else
            render json: {error: foodPlan.errors.full_messages.join(';')}
        end
    end

    def destroy
        foodPlan = FoodPlan.find(params[:id])
        foodPlan.destroy
    end
end
