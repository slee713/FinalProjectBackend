class Api::V1::MessagesController < ApplicationController
  def index
    hiking_trip = HikingTrip.find(params[:hiking_trip_id])
    messages = hiking_trip.messages.sort_by(&:created_at)

    render json: messages, include: [:user_hike => {include: [:user]}]
  end

  def create
    userHike = UserHike.find_by(user_id: @user.id, hiking_trip_id: params[:hiking_trip_id])
    message = Message.new(user_hike_id: userHike.id, content: params[:content])
    if message.valid?
      message.save

      render json: message, include: [:user_hike => {include: [:user]}], exclude: [:updated_at]
    else
      render json: {error: "Message could not be created"}
    end
    
  end

  
end
