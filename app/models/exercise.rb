class Exercise < ApplicationRecord

  has_many :set_exercises

  has_many :days, through: :set_exercises

  validates(
  :name,
  uniqueness: true
  )

  validates_inclusion_of :category, :in => ["Compound", "Isolation"]

  validates_inclusion_of :muscle_group, :in => [
    "Chest",
    "Back",
    "Legs",
    "Shoulders",
    "Arms",
    "Abdominals"
  ]

end
