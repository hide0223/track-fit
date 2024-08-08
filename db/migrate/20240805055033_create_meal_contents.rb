class CreateMealContents < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_contents do |t|
      t.integer :meal_id, null: false
      t.integer :meal_summary, null: false
      t.integer :eat_meal, null: false
      t.integer :kcal, null: false
      t.timestamps
    end
  end
end
