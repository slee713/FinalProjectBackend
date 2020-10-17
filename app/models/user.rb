class User < ApplicationRecord
    has_secure_password

    has_many :friendships, :dependent => :destroy
    has_many :friends, through: :friendships, :dependent => :destroy

    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => 'friend_id', :dependent => :destroy
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user, :dependent => :destroy

    has_many :user_hikes, dependent: :destroy
    has_many :hiking_trips, through: :user_hikes
    has_many :food_plans, through: :user_hikes, :dependent => :destroy
    has_many :group_gear_items, through: :user_hikes, :dependent => :destroy
    
    has_many :personal_gear_items, :dependent => :destroy


    validates :username, :password, :email, :first_name, :last_name, presence: true
    validates :username, uniqueness: {case_sensitive: false}
    validates :email, uniqueness: {case_sensitive: false} 


    def nonFriends
        friends = self.friends
        nonFriends = User.all.find_all { | user| !friends.include?(user) && user!= self}
        return nonFriends
    end

    def friendRequests
        friend_ids = self.friends.map{|friend| friend.id}
        friendships = Friendship.where(friend_id: self.id)
        friendRequests = friendships.find_all { |friendship| !friend_ids.include?(friendship.user_id)}
        return friendRequests
    end

    def friendTrips
        trips = []
        self.friends.each {|f|
            f.hiking_trips.each {|trip| trips.push(trip)}
        }
        return trips.uniq

    end

end
