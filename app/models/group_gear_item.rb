class GroupGearItem < ApplicationRecord
    belongs_to :user_hike
    validates :name, presence: true
    validates :qty, presence: true
end
