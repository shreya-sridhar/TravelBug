class Activity < ApplicationRecord
    has_many :destination_activities, dependent: :destroy
    has_many :destinations, through: :activities
end
