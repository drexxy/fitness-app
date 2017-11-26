class TrainerProfile < ApplicationRecord

  belongs_to :customer

  has_many :workouts

  has_many :days
end
