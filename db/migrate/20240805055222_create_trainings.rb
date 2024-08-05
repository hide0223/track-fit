class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|

      t.timestamps
    end
  end
end
