class Api::V1::AuthController < ApplicationController
    skip_before_action :logged_in?, only: [:create]

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {user: user, token: encode_token({user_id: user.id})}, 
                            include: [:friends, :personal_gear_items, :food_plans],
                            status: 200
        else
            render json: {error: 'Invalid Credentials'}
        end
    end
    
end