class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy 

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates :address, presence: true
  validates :password_digest, presence: true 
end
