class Agent < ApplicationRecord
  has_secure_password
  has_many :properties
  has_many :clients, through: :properties

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |agent|
      agent.password = SecureRandom.hex
    end
  end

  def next_property(id)
    self.properties.where('id > ?', id).first
  end
end


      #u.email = auth['info']['email']
      #u.image = auth['info']['image']
