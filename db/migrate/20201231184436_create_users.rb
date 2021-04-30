class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :name
      t.integer :age
      t.text :hometown

      t.timestamps
    end
  end
end
