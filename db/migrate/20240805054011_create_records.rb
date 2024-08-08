class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.integer :customer_id, null: false
      t.references :content, polymorphic: true, null: false
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
