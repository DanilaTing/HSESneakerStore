class Sneaker < ApplicationRecord
  belongs_to :brand
  mount_uploader :image, ImageUploader
  validates :brand_id, :image, :model, presence: true
end
