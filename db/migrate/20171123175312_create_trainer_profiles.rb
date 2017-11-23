class CreateTrainerProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :trainer_profiles do |t|
      t.string :name
      t.string :profile_picture
      t.string :gym_name
      t.string :gym_postcode
      t.string :years_experience
      t.string :qualification
      t.string :rate
      t.string :bio

      t.timestamps
    end
  end
end
