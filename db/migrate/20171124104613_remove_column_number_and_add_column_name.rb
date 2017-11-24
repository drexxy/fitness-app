class RemoveColumnNumberAndAddColumnName < ActiveRecord::Migration[5.1]
  def change
    add_column :days, :name, :string
    remove_column :days, :number
  end
end
