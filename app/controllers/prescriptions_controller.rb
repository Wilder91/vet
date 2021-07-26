class PrescriptionsController < ApplicationController
    

    def new
        #binding.pry 
        @prescription = Prescription.new(pet_id: params[:pet_id])
        @medications = Medication.all
    end

    def create
        @prescription = Prescription.new
        med = Medication.find_by(name: params[:prescription][:medication_name])
        doc = Doctor.find_by(name: params[:prescription][:doctor_name])
        pet = Pet.find_by(id: params[:prescription][:pet_id])
        @prescription.doctor_id = doc.id
        @prescription.medication_id = med.id
        @prescription.dosage = med.dose * pet.weight
        @prescription.pet_id = pet.id
        if @prescription.valid?
            @prescription.save 
            redirect_to prescription_path(@prescription)
        else 
            redirect_to new_pet_prescription_path(pet)
        end
    end

    def show 
        @prescription = Prescription.find_by(id: params[:id])
    end

    def destroy
        @prescription = Prescription.find(params[:id])
        @prescription.destroy
        redirect_to owner_path
    end

    private 

    def prescription_params

    end


end