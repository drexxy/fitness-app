class RemoveColumnSetExerciseIdFromDays < ActiveRecord::Migration[5.1]
  def change
    remove_column :days, :set_exercise_id
  end
end
