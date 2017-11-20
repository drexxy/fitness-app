class RenameColumnGoalToGoalIdInProfiles < ActiveRecord::Migration[5.1]
  def change
    rename_column :profiles, :goal, :goal_id 
  end
end
