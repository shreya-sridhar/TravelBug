class AddEndDateToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :end_date, :datetime
  end
end
