class Customer < ApplicationRecord
  has_many :subscriptions, dependent: :destroy 

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :password_digest, presence: true 
end
