class AddCoulmnDayCountToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column :workouts, :day_count, :integer
  end
end
