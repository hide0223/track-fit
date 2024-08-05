class CreateMealContents < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_contents do |t|

      t.timestamps
    end
  end
end
