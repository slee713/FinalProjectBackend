class User < ApplicationRecord
    has_secure_password

    has_many :friendships
    has_many :friends, through: :friendships

    has_many :user_hikes
    has_many :hiking_trips, through: :user_hikes
    has_many :food_plans, through: :user_hikes
    has_many :group_gear_items, through: :user_hikes
    
    has_many :personal_gear_items

    has_many :questions
    has_many :answers
    has_many :likes

    validates :username, :password, :email, :first_name, :last_name, presence: true
    validates :username, uniqueness: {case_sensitive: false}
    validates :email, uniqueness: {case_sensitive: false} 
end
