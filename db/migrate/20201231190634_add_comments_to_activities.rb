class AddCommentsToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :comments, :text
  end
end
