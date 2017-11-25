class Workout < ApplicationRecord

  has_and_belongs_to_many :days

  # belongs_to :trainer_profile
end
