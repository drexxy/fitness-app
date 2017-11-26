class AddTrainerProfileIdToDays < ActiveRecord::Migration[5.1]
  def change
    add_column :days, :trainer_profile_id, :integer
  end
end
