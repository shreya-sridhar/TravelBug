class Destination < ApplicationRecord
    has_many :destination_foods, dependent: :destroy
    has_many :foods, through: :destination_foods
    has_many :destination_activities, dependent: :destroy
    has_many :activities, through: :destination_activities


    def self.countries 
        Destination.all.map{|d| d.country}.uniq
        #Destination.select(:country).distinct
    end

end
