class Workout < ApplicationRecord

  has_and_belongs_to_many :days

  has_many :set_exercises , through: :days

  has_many :exercises , through: :set_exercises

  has_many :profiles

  belongs_to :trainer_profile, optional: true
end
