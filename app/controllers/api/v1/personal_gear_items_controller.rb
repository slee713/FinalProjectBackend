class Api::V1::PersonalGearItemsController < ApplicationController

    def create
        item = PersonalGearItem.new(user_id: @user.id, name: params[:name], qty: params[:qty], notes: params[:notes])

        if item.valid?
            item.save
            render json: item
        else 
            render json: {error: item.errors.full_messages.join(';')}
        end
    end


    def update
        item = PersonalGearItem.find(params[:id])
        item.assign_attributes(personal_gear_item_params)

        if item.valid?
            item.save
            render json: item
        else 
            render json: {error: item.errors.full_messages.join(';')}
        end
    end

    def destroy
        item = PersonalGearItem.find(params[:id])
        item.destroy
    end

    private 

    def personal_gear_item_params
        params.permit(:name, :qty, :notes)
    end
end
