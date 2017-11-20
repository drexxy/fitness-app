class ChangeWeightToFloatOnProfiles < ActiveRecord::Migration[5.1]
  def change
    change_column :profiles, :weight, :float
  end
end
