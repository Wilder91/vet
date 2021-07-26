class Pet < ActiveRecord::Base
    has_many :prescriptions 
    has_many :doctors, through: :prescriptions
    has_many :medications, through: :prescriptions
    belongs_to :owner

    validates_presence_of :name, :age, :weight, :species
    validates :name, uniqueness: {scope: :owner_id}
    
end