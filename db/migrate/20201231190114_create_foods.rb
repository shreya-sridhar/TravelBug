class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :cuisine
      t.string :restaurant_name
      t.string :dish
      t.string :image

      t.timestamps
    end
  end
end
