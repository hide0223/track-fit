class CreateMealFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_favorites do |t|
      t.integer :customer_id
      t.integer :meal_id
      t.timestamps
    end
  end
end
