class Api::V1::FriendshipsController < ApplicationController
    def index
        friendRequests = @user.friendRequests

        render json: friendRequests, include: [ :user]
    end

    def create
        
    end

    def destroy
    end

end
