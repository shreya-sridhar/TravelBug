class RenameColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :trips, :date, :start_date
  end
end
