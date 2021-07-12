class PrescriptionsController < ApplicationController

    def new 

    end

    def create 
        @prescription = Prescription.new
        #binding.pry
        pet = Pet.find_by(name: params[:pet_name])
        med = Medication.find_by(name: params[:medication_name])
        #binding.pry
        @prescription.pet_id = pet.id 
        @prescription.doctor_id = 1
        @prescription.medication_id = med.id
        @prescription.dosage = med.dose * pet.weight
        @prescription.save 
        #binding.pry
        redirect_to prescription_path(@prescription)

    end

    def show 
        @prescription = Prescription.find_by(id: params[:id])
    end

    def destroy
        @prescription = Prescription.find(params[:id]).destroy
        @prescription.destroy
        redirect_to owner_path
      end


end