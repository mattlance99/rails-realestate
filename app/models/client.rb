class Client < ApplicationRecord
  has_many :properties
  has_many :agents, through: :properties
end
