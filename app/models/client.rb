class Client < ApplicationRecord
  has_many :properties
  has_many :agents, through: :properties

  def last_name_first_name
    self.last_name + ", " + self.first_name
  end

end
