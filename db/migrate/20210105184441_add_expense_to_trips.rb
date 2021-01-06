class AddExpenseToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :expense, :integer
  end
end
