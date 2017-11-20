class AddGoalToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :goal, :integer
  end
end
