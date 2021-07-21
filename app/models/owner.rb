class Owner < ApplicationRecord
    has_many :pets
    has_secure_password validations: false

    validates_presence_of :name
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :email, uniqueness: true

    def self.from_omniauth(response)
        Owner.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |o|
            o.name = response[:info]["name"]
            o.email = response[:info]["email"]
            o.password = SecureRandom.hex(15) 
        end
    end
end
