class Api::V1::FriendshipsController < ApplicationController
    def index
        friendRequests = @user.friendRequests

        render json: friendRequests, include: [ :user]
    end

    def create
        friendship = Friendship.new(friendship_params)
        if friendship.valid?
            friendship.save
            render json: friendship
        else 
            render json: {error: 'Unable To add friend'}
        end
    end

    def destroy
        friendship = Friendship.find(params[:id])
        friendship.destroy
    end

    def remove_friend
        friendship1 = Friendship.find_by(user_id: @user.id, friend_id: params[:friend_id])
        friendship2 = Friendship.find_by(user_id: params[:friend_id], friend_id: @user.id)
        friendship1.destroy
        friendship2.destroy
    end

    private 

    def friendship_params
        params.permit(:user_id, :friend_id)
    end
end
