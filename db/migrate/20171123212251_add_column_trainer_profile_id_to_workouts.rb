class AddColumnTrainerProfileIdToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column :workouts, :trainer_profile_id, :integer
  end
end
