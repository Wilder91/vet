class PrescriptionsController < ApplicationController

    def new 

    end

    def create 
        @prescription = Prescription.new
        #binding.pry
        pet = Pet.find_by(name: params[:pet_name])
        @prescription.pet_id = pet.id 
        @prescription.save 
        redirect_to prescription_path(@prescription)

    end


end