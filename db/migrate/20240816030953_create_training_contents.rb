class CreateTrainingContents < ActiveRecord::Migration[6.1]
  def change
    create_table :training_contents do |t|
      t.references :training, foreign_key: true
      t.string :weight, null: false
      t.string :body_parts
      t.string :exercise, null: false
      t.integer :sets, null: false
      t.integer :reps, null: false
      t.timestamps
    end
  end
end
