class CreateMealComments < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_comments do |t|
      t.integer :customer_id
      t.integer :meal_id
      t.text :comment
      t.timestamps
    end
  end
end
