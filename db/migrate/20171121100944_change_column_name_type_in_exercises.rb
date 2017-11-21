class ChangeColumnNameTypeInExercises < ActiveRecord::Migration[5.1]
  def change
    rename_column :exercises, :type, :category
  end
end
