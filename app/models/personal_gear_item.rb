class PersonalGearItem < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    validates :qty, presence: true
end
