class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|
      t.text :location
      t.text :country
      t.text :description
      t.text :image

      t.timestamps
    end
  end
end
