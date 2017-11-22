class AddExerciseIdToSetExercises < ActiveRecord::Migration[5.1]
  def change
    add_column :set_exercises, :exercise_id, :integer
  end
end
