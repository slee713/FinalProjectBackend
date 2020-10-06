class UserHike < ApplicationRecord
    belongs_to :user 
    belongs_to :hiking_trip

    has_many :food_plans
    has_many :group_gear_items
    
end
