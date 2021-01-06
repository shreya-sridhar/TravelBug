class AddActivitiesIdsToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :activities, :text
  end
end
