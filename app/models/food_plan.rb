class FoodPlan < ApplicationRecord
    belongs_to :user_hike
 
    validates :day, presence: true
    
end
