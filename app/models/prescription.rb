class Prescription < ActiveRecord::Base
    belongs_to :pets 
    belongs_to :doctors
    belongs_to :medications
end