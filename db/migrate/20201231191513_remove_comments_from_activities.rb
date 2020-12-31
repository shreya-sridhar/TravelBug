class RemoveCommentsFromActivities < ActiveRecord::Migration[6.1]
  def change
    remove_column :activities, :comments, :text
  end
end
