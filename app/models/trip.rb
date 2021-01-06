class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :destination
  validate :trip_date

    def trip_date
        if self.date.to_i < DateTime.now.to_i
            errors.add(:date, "Date is in the past. Please input a valid date.")
        end 
    end 

    def hash_of_activities
        hash = {}
        if self.activities
            self.activities.split(' ').each do |act|
                a = Activity.find(act.to_i)
                hash[a.name] = Activity.find(act.to_i).price * self.num_of_people
            end
        end
        return hash
    end

    def total_expense
        total = 0
        self.hash_of_activities.each do |k,v|
            total += v 
        end
        return total
    end

    def average_trip_time_by_destination

    end

    def self.average_trip_budget
        budgets = Trip.all.map{|t| t.budget}.compact
        avg_budget = budgets.sum/budgets.count
    end

    def self.average_budget_by_destination(destination)
        trips = Trip.where(destination_id: destination)
        budgets = trips.all.map{|t| t.budget}.compact
        avg_budget = budgets.sum/budgets.count
    end

    def self.trip_frequency_by_date(mon)
        dates = Trip.all.map{|t| t.date}.compact
        
        case mon
        when 1
            dates.map{|d| d.month if d.month == 1}.compact.count
        when 2
            dates.map{|d| d.month if d.month == 2}.compact.count
        when 3
            dates.map{|d| d.month if d.month == 3}.compact.count
        when 4
            dates.map{|d| d.month if d.month == 4}.compact.count
        when 5
            dates.map{|d| d.month if d.month == 5}.compact.count
        when 6
            dates.map{|d| d.month if d.month == 6}.compact.count
        when 7
            dates.map{|d| d.month if d.month == 7}.compact.count
        when 8
            dates.map{|d| d.month if d.month == 8}.compact.count
        when 9
            dates.map{|d| d.month if d.month == 9}.compact.count
        when 10
            dates.map{|d| d.month if d.month == 10}.compact.count
        when 11
            dates.map{|d| d.month if d.month == 11}.compact.count
        when 12
            dates.map{|d| d.month if d.month == 11}.compact.count
        end

    end

    # def featured_destinations
    #     destinations = Trip.all.map{|t| t.destination}.compact 
    #     dest_count = {}
    #     destination.each do |d|
    #         if not dest_count.key?(d)
    #             dest_count[d] = destination.count(d)
    #         end
    #     end
    #     byebug
    #     dest_count.sort.to_h.first(4)
    # end

end


