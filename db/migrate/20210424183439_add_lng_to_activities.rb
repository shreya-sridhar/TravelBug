class AddLngToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :lng, :string
  end
end
