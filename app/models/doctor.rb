class Doctor < ActiveRecord::Base 
    has_many :medications 
    has_many :pets, through: :medications
end