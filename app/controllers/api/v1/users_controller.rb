class Api::V1::UsersController < ApplicationController
    skip_before_action :logged_in?, only: [:create]

    def create
        byebug
        user = User.new(user_params)
        if user.valid?
            user.save
            render json: {username: user.username, token: encode_token({user_id: user.id})}, status: 200
        else
            render json: {error: user.errors.full_messages}, status: :not_acceptable
        end
    end


    private

    def user_params
        params.permit(:username, :password, :email, :first_name, :last_name, :img_url)
    end

end
