class CreateRecordComments < ActiveRecord::Migration[6.1]
  def change
    create_table :record_comments do |t|

      t.timestamps
    end
  end
end
