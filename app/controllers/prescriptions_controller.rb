class PrescriptionsController < ApplicationController
    

    def new
        #binding.pry 
        @prescription = Prescription.new(pet_id: params[:pet_id])
        @medications = Medication.all
    end

    def create
        @prescription = Prescription.new
        @prescription.medication_id = Medication.find_by(name: params[:prescription][:medication_name]).id
        @prescription.doctor_id = Doctor.find_by(name: params[:prescription][:doctor_name]).id
        @prescription.pet_id = Pet.find_by(id: params[:prescription][:pet_id]).id
        @prescription.dosage = @prescription.medication.dose * @prescription.pet.weight
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