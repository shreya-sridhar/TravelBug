class AddAddressToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :address, :text
  end
end
