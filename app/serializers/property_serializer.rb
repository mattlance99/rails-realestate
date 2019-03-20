class PropertySerializer < ActiveModel::Serializer
  attributes :id, :address, :price, :bedrooms, :bathrooms, :agent_id, :client_id
end
