class Exercise < ApplicationRecord

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
