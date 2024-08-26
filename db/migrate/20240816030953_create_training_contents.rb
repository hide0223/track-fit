class CreateTrainingContents < ActiveRecord::Migration[6.1]
  def change
    create_table :training_contents do |t|
      t.references :training, foreign_key: true
      t.string :weight
      t.string :body_parts
      t.string :exercise, null: false
      t.integer :sets
      t.integer :reps
      t.timestamps
    end
  end
end
