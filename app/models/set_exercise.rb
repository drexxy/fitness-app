class SetExercise < ApplicationRecord
  belongs_to :exercise

  belongs_to :day, -> {includes :exercises}
end
