class AddLatToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :lat, :string
  end
end
