class Prescription < ActiveRecord::Base
    belongs_to :pet 
    belongs_to :doctor
    belongs_to :medication
end