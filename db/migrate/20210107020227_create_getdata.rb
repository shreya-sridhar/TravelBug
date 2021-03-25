class CreateGetdata < ActiveRecord::Migration[6.1]
  def change
    create_table :getdata do |t|

      t.timestamps
    end
  end
end
