class AddColumnsToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column :workouts, :name, :string
    add_column :workouts, :difficulty, :string
    add_column :workouts, :purpose, :string
  end
end
