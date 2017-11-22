class CreateSetExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :set_exercises do |t|
      t.integer :sets
      t.string :reps

      t.timestamps
    end
  end
end
