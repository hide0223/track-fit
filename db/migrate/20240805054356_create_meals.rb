class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.integer :customer_id, null: false
      t.string :title
      t.text :body
      t.string :category, null: false
      t.timestamps
    end
  end
end
