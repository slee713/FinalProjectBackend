class Api::V1::UsersController < ApplicationController
    skip_before_action :logged_in?, only: [:create]

    def index
        # grab all users that are not friends with current user
        users = @user.nonFriends
        

        render json: users, except: [:password_digest, :created_at, :updated_at]
    end

    def create
        
        user = User.new(user_params)
        if user.valid?
            user.save
            render json: {user: user, token: encode_token({user_id: user.id})}, 
                        except: [:password_digest,:created_at, :updated_at ],
                        include: [
                            :friends => {except: [:password_digest, :created_at, :updated_at]}, 
                            :personal_gear_items => {except: [:created_at, :updated_at]}, 
                            :food_plans => {except: [:created_at, :updated_at]}
                        ],
                        status: 200
        else
            render json: {error: user.errors.full_messages.join(';')}, status: :not_acceptable
        end
    end


    private

    def user_params
        params.permit(:username, :password, :email, :first_name, :last_name, :img_url)
    end

end
