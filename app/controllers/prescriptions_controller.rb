class PrescriptionsController < ApplicationController
    #before_action :require_login

    def new 
        @prescription = Prescription.new
    end

    def create 
        @prescription = Prescription.new
        pet = Pet.find_by(name: params[:pet_name])
        med = Medication.find_by(name: params[:medication_name])
        doc = Doctor.find_by(name: params[:doctor_name])
        @prescription.pet_id = pet.id 
        @prescription.doctor_id = 1
        @prescription.medication_id = med.id
        @prescription.dosage = med.dose * pet.weight
        @prescription.doctor_id = doc.id 
        @prescription.save 
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

    private 

    def prescription_params

    end


end