class Day < ApplicationRecord
  has_many :set_exercises

  has_many :exercises, through: :set_exercises

  has_and_belongs_to_many :workouts

  belongs_to :trainer_profile

  accepts_nested_attributes_for :set_exercises
end
