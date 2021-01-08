class User < ApplicationRecord
    has_many :trips, dependent: :destroy
    has_many :destinations, through: :trips

    has_many :likes, dependent: :destroy 
    has_many :activities, through: :likes

    validates_presence_of :name, :age
    validates_uniqueness_of :name

    validates :age, numericality: {greater_than: 18}

    has_secure_password 
end
