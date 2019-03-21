class AgentSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :properties
end
