class Activity < ApplicationRecord
    has_many :destination_activities, dependent: :destroy
    has_many :destinations, through: :activities
    has_many :likes, dependent: :destroy
    has_many :users, through: :likes

    def likes_count
        count = 0

        self.likes.each do |like| 
            if like.emoji == '👍'
                count += 1
            end
        end
        return count
    end

    def dislikes_count
        count = 0

        self.likes.each do |like| 
            if like.emoji == '👎'
                count += 1
            end
        end
        return count
    end
end
