class AddTextToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :text, :text
  end
end
