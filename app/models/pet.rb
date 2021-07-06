class Pet < ActiveRecord::Base 
    has_many :doctors, through: :prescriptions
    has_many :medications, through: :prescriptions
    belongs_to :owner
end