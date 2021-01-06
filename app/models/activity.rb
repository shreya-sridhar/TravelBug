class Activity < ApplicationRecord
    has_many :destination_activities, dependent: :destroy
    has_many :destinations, through: :activities
    has_many :likes, dependent: :destroy
    has_many :users, through: :likes

    def likes_count
        count = self.likes.select{ |like| like.emoji == '👍' }.length  
    end

    def dislikes_count
        count = self.likes.select{ |like| like.emoji == '👎' }.length
    end
end
