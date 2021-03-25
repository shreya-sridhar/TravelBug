class AddLonToDestination < ActiveRecord::Migration[6.1]
  def change
    add_column :destinations, :lon, :float
  end
end
