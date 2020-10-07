class Api::V1::AuthController < ApplicationController
    skip_before_action :loggend_in?, only: [:create]

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {username: user.username, token: encode_token({user_id: user.id})}, status: 200
        else
            render json: {error: 'Invalid Credentials'}
        end
    end
end