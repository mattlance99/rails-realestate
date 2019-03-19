class PropertySerializer < ActiveModel::Serializer
  attributes :id, :address, :price, :bedrooms, :bathrooms
end
