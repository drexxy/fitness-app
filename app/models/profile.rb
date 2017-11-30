class Profile < ApplicationRecord

  validates(
  :display_name,
  length: { in: 6..20},
  uniqueness: true,
  format: { with: /\A[a-zA-Z0-9]*\z/,
  message: "only allows letters and numbers" } 
  )
  validates :days, numericality: true, allow_nil: true

  validates :weight, numericality: { greater_than: 0 }, allow_nil: true

  validates_inclusion_of :experience, :in => ["", "Beginner", "Intermediate", "Expert"]

  mount_uploader :profile_picture, ProfilePictureUploader

  belongs_to :goal, optional: true

  belongs_to :customer

  belongs_to :workout, optional: true
end
