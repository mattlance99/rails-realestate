class Agent < ApplicationRecord
  has_secure_password
  has_many :properties
  has_many :clients, through: :properties

  validates :email, uniqueness: true
end
