class Workout < ApplicationRecord

  has_and_belongs_to_many :days

  has_many :profiles

  belongs_to :trainer_profile, optional: true
end
