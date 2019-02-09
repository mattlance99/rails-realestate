class Property < ApplicationRecord
  belongs_to :agent
  belongs_to :client

  validates :address, presence: true
end
