class Destination < ApplicationRecord
    has_many :destination_foods, dependent: :destroy
    has_many :foods, through: :destination_foods
    has_many :destination_activities, dependent: :destroy
    has_many :activities, through: :destination_activities

end
