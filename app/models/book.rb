class Book < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :genre, presence: true
  validates :image, presence: true
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
end
