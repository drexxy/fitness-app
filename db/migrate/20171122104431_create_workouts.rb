class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|

      t.timestamps
    end
  end
end
