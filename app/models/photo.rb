class Photo < ApplicationRecord
  has_many :package_photos, dependent: :destroy 
  has_one_attached :photo
end
