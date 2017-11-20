class AddWeightToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :weight, :integer
  end
end
