class Message < ApplicationRecord
    belongs_to :user_hike

    validates :content, presence: true
end
