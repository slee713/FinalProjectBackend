class FoodPlan < ApplicationRecord
    belongs_to :user_hike
    validates :user_hike_id, presence: true
    validates :day, presence: true
    
end
