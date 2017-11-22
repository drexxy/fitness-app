class RenameWorkoutDaysTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :table_workouts_days, :workouts_days
  end
end
