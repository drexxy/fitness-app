class AddWorkoutIdToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :workout_id, :integer
  end
end
