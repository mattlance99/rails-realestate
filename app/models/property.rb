class Property < ApplicationRecord
  belongs_to :agent
  belongs_to :client, optional: true

  validates :address, presence: true
  validates :address, uniqueness: true
  validates :price, presence: true
  validates :bathrooms, presence: true, numericality: { greater_than: 0 }
  validates :bedrooms, presence: true, numericality: { greater_than: 0 }

  def property_details
    "Price: " + self.price + "  Bedrooms: " + self.bedrooms.to_s + "  Bathrooms: " + self.bathrooms.to_s
  end
end
