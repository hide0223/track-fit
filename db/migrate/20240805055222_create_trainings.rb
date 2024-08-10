class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.integer :customer_id, null: false
      t.text :body
      t.string :weight, null: false
      t.string :body_parts, null: false
      t.string :exercise, null: false
      t.integer :sets, null: false
      t.integer :reps, null: false
      t.timestamps
    end
  end
end
