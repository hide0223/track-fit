class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.string :weight, null: false
      t.string :body_parts, null: false
      t.integer :sets, null: false
      t.integer :reps, null: false
      t.float :calories_burneds, null: false
      t.timestamps
    end
  end
end
