class CreateMealContents < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_contents do |t|
      t.references :meal, foreign_key: true
      t.string :meal_summary, null: false
      t.string :eat_meal, null: false
      t.integer :kcal, null: false
      t.timestamps
    end
  end
end
