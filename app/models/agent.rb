class Agent < ApplicationRecord
  has_secure_password
  has_many :properties
  has_many :clients, through: :properties

  validates :email, presence: true
  validates :email, uniqueness: true

  #def self.find_or_create by omniauth(auth_hash)
  
end
