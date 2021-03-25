class AddLatToDestination < ActiveRecord::Migration[6.1]
  def change
    add_column :destinations, :lat, :float
  end
end
