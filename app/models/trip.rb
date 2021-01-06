class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  validate :trip_date

    def trip_date
        if self.start_date.to_i < DateTime.now.to_i
            errors.add(:start_date, "Date is in the past. Please input a valid date.")
        end 
    end 
end
