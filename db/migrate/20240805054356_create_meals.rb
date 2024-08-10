class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.integer :customer_id, null: false
      t.integer :category, null: false
      t.integer :meal_summary, null: false
      t.integer :eat_meal, null: false
      t.integer :kcal, null: false
      t.timestamps
    end
  end
end
