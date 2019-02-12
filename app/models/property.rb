class Property < ApplicationRecord
  belongs_to :agent
  belongs_to :client, optional: true

  validates :address, presence: true
end
