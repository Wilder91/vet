class MedicationsController < ApplicationController
    def index 
        @medications = Medication.all
        #binding.pry
    end

    def show 
        @medication = Medication.find(params[:id])
        @medications = Medication.all
    end
end