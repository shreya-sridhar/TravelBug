class AddBudgetToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :budget, :integer
  end
end
