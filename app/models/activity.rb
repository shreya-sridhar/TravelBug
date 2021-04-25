class Activity < ApplicationRecord
  belongs_to :trip
  has_many :likes, dependent: :destroy 
  has_many :users, through: :likes
end
