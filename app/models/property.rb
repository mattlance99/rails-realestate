class Property < ApplicationRecord
  belongs_to :agent
  belongs_to :client
end
