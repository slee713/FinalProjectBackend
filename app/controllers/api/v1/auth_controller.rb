class Api::V1::AuthController < ApplicationController
    skip_before_action :logged_in?, only: [:create]

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {user: user, token: encode_token({user_id: user.id})},
                        except: [:password_digest,:created_at, :updated_at ],
                        include: [
                            :friends => {except: [:password_digest, :created_at, :updated_at]}, 
                            :personal_gear_items => {except: [:created_at, :updated_at]}, 
                            :food_plans => {include: [:user_hike], except: [:created_at, :updated_at]}
                        ],
                        status:200
        else
            render json: {error: 'Invalid Credentials'}
        end
    end
    
end