class CreateDestinationActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :destination_activities do |t|
      t.belongs_to :destination, null: false, foreign_key: true
      t.belongs_to :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
