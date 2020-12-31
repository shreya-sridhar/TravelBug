class Food < ApplicationRecord
    has_many :destination_foods, dependent: :destroy
    has_many :destinations, through: :destination_foods
end
