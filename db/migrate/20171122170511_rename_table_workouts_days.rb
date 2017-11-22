class RenameTableWorkoutsDays < ActiveRecord::Migration[5.1]
  def change
    rename_table :workouts_days, :days_workouts
  end
end
