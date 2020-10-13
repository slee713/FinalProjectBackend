class Api::V1::UserHikesController < ApplicationController
  def create
    userHike = UserHike.find_by(user_id: params[:user_id], hiking_trip_id: params[:hiking_trip_id])
    
    if userHike
      render json: {error: "Friend is already a member of the Hiking Trip"}
    else 
      userHike = UserHike.new(user_hike_params)

      if userHike.valid?
        userHike.save
        render json: userHike
      else 
        render json: {error: "Unable to Add Friend"}
      end
    end
  end

  def destroy
    userHike = UserHike.find_by(user_hike_params)
    userHike.destroy
  end

  private 

  def user_hike_params 
    params.permit(:user_id, :hiking_trip_id)
  end

end
