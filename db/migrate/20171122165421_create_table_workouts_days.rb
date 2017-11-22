class CreateTableWorkoutsDays < ActiveRecord::Migration[5.1]
  def change
    create_table :table_workouts_days do |t|
      t.integer :workout_id
      t.integer :day_id
    end
  end
end
