class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|
      t.string :location
      t.string :country
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
