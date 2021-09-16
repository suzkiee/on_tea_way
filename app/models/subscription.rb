class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :tea

  validates :title, presence: true
  validates :price, presence: true, numericality: true
  validates :status, presence: true
  validates :frequency, presence: true
end
