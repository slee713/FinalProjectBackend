class Api::V1::GroupGearItemsController < ApplicationController
    def create
        userHike = UserHike.find_by(user_id: @user.id , hiking_trip_id: params[:hiking_trip_id].to_i)
       
        item = GroupGearItem.new(
            name: params[:name],
            qty: params[:qty],
            notes: params[:notes],
            user_hike_id: userHike.id
        )
        if item.valid?
            item.save
            render json: item,  except: [:updated_at, :created_at]
        else 
            render json: {error: item.errors.full_messages.join(';')}
        end
    end

    def update
        item = GroupGearItem.find(params[:id])
        item.assign_attributes(group_gear_item_params)

        if item.valid?
            item.save
            render json: item,  except: [:updated_at, :created_at]
        else
            render json: {error: item.errors.full_messages.join(';')}
        end
    end

    def destroy
        item = GroupGearItem.find(params[:id])
        item.destroy
    end


    private 

    def group_gear_item_params
        params.permit(:name, :qty, :notes)
    end
end
