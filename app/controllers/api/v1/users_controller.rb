class Api::V1::UsersController < ApplicationController
    skip_before_action :logged_in?, only: [:create]

    def create
        
        user = User.new(user_params)
        if user.valid?
            user.save
            render json: {id: user.id, token: encode_token({user_id: user.id})}, status: 200
        else
            render json: {error: user.errors.full_messages.join(';')}, status: :not_acceptable
        end
    end


    private

    def user_params
        params.permit(:username, :password, :email, :first_name, :last_name, :img_url)
    end

end
