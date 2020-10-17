class HikingTrip < ApplicationRecord
    has_many :user_hikes, :dependent => :destroy
    has_many :users, through: :user_hikes
    has_many :group_gear_items, through: :user_hikes, :dependent => :destroy
    has_many :messages, through: :user_hikes, :dependent => :destroy
    has_many :stops, :dependent => :destroy



    validates :name, presence: true
    validates :description, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :hiking_project_id, presence: true

end
