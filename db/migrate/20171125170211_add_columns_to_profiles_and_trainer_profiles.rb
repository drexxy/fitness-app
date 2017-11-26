class AddColumnsToProfilesAndTrainerProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :customer_id, :integer
    add_column :trainer_profiles, :customer_id, :integer
  end
end
