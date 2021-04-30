class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.text :cuisine
      t.text :restaurant_name
      t.text :dish
      t.text :image

      t.timestamps
    end
  end
end
