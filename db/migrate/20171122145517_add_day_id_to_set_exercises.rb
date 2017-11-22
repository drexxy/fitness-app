class AddDayIdToSetExercises < ActiveRecord::Migration[5.1]
  def change
    add_column :set_exercises, :day_id, :integer
  end
end
