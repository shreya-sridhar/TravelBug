class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  validate :trip_date

    def trip_date
        if self.date.to_i < DateTime.now.to_i
            errors.add(:date, "Date is in the past. Please input a valid date.")
        end 
    end 
end
