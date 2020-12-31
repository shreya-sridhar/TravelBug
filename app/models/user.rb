class User < ApplicationRecord
    has_many :trips, dependent: :destroy
    has_many :destinations, through: :trips

    has_many :likes, dependent: :destroy 
    has_many :activities, through: :likes
end
