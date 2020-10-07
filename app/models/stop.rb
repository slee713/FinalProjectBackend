class Stop < ApplicationRecord
    belongs_to :hiking_trip
    validates :stop, presence: true
    validates :name, presence: true
    validates :distance, presence: true
    
end
