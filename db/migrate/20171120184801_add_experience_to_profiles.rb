class AddExperienceToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :experience, :string
  end
end
