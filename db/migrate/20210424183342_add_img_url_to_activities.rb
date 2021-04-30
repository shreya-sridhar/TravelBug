class AddImgUrlToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :img_url, :text
  end
end
