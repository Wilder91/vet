class MedicationsController < ApplicationController
    def index 
        @medications = Medication.all
        #binding.pry
    end

    def show 
        @medication = Medication.find(params[:id])
        
    end
end