class AddDaysToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :days, :integer
  end
end
