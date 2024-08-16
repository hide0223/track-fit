class CreateTrainingFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :training_favorites do |t|
      t.integer :customer_id
      t.integer :training_id
      t.timestamps
    end
  end
end
