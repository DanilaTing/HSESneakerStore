class Brand < ApplicationRecord
  mount_uploader :logo, LogoUploader
  has_many :sneakers
end
