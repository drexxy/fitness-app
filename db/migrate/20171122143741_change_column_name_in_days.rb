class ChangeColumnNameInDays < ActiveRecord::Migration[5.1]
  def change
    rename_column :days, :exercise_set_id, :set_exercise_id
  end
end
