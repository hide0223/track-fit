class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.integer :category, null: false
      t.timestamps
    end
  end
end
