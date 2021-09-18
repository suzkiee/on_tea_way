class Photo < ApplicationRecord
  belongs_to :user
  has_many :package_photos, dependent: :destroy 
  has_one_attached :upload
end
