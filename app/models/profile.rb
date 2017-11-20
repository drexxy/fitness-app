class Profile < ApplicationRecord

  validates(
  :display_name,
  length: { in: 6..20},
  uniqueness: true,
  format: { with: /\A[a-zA-Z0-9]*\z/,
  message: "only allows letters and numbers" } 
  )
  validates :days, numericality: true

  mount_uploader :profile_picture, ProfilePictureUploader
  
  belongs_to :goal, optional: true
end
