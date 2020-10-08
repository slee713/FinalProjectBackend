class HikingTrip < ApplicationRecord
    has_many :user_hikes
    has_many :users, through: :user_hikes
    has_many :group_gear_items, through: :user_hikes
    has_many :stops

    validates :name, presence: true
    validates :description, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :hiking_project_id, presence: true

end
