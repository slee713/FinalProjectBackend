class Api::V1::UsersController < ApplicationController
    skip_before_action :logged_in?, only: [:create, :update]

    def index
        # grab all users that are not friends with current user
        users = @user.nonFriends
        
        users_by_username = users.find_all{|user| user.username.downcase.include?(params[:search]) }
        users_by_first_name= users.find_all{|user| user.first_name.downcase.include?(params[:search]) }
        users_by_email = users.find_all{|user| user.email.include?(params[:search])}

        users = [*users_by_username, *users_by_first_name, *users_by_email].uniq
        
    
        if users.length > 0
            render json: users, except: [:password_digest, :created_at, :updated_at]
        else 
            render json: { error: "User not found. Please search by first name, username or email."}
        end
    end

    def show
        user = User.find(params[:id])
        render json: user, except: [:password_digest, :created_at, :updated_at],
                            include: [
                                :friends => {except: [:password_digest, :created_at, :updated_at]}, 
                                :personal_gear_items => {except: [:created_at, :updated_at]}, 
                                :food_plans => {include: [:user_hike],except: [:created_at, :updated_at]}
                            ],
                            status: 200
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

    def update
        user = User.find(params[:id])
        if user.authenticate(params[:password])
            user.assign_attributes(user_params)

            if user.valid?
                user.save
                render json: user, 
                except: [:password_digest,:created_at, :updated_at ],
                include: [
                    :friends => {except: [:password_digest, :created_at, :updated_at]}, 
                    :personal_gear_items => {except: [:created_at, :updated_at]}, 
                    :food_plans => {except: [:created_at, :updated_at]}
                ],
                status: 200
            else
                render json: {error: user.errors.full_messages.join(';')}
            end
        else
            render json: {error: "Password is Incorrect"}
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
    end


    private

    def user_params
        params.permit(:username, :password, :email, :first_name, :last_name, :img_url)
    end

end
