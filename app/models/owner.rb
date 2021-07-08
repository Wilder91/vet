class Owner < ApplicationRecord
    has_many :pets

    validates_presence_of :name, uniqueness: true
    
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :email, uniqueness: true
end
