class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.integer :number
      t.integer :exercise_set_id

      t.timestamps
    end
  end
end
