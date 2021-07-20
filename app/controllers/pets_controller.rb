class PetsController < ApplicationController
    before_action :require_login

    def index 
        @pets = Pet.all
         
    end

    def show 
        @pet = Pet.find(params[:id])
        @prescriptions = Prescription.where(pet_id: @pet.id)
    end

    def new 
       @pet = Pet.new
    end

    def create
        @pet = Pet.new(pet_params)
        @pet.owner = current_owner
        @pet.save
        redirect_to owner_pet_path(current_owner.id, @pet.id)
    end

    def edit 
        @pet = Pet.find(params[:id])
    end

    def update 
        @pet = Pet.find(params[:id])
        @pet.update(age: params[:pet][:age], weight: params[:pet][:weight])
        redirect_to pet_path(@pet)
    end

    def destroy
        @pet = Pet.find(params[:id]).destroy
        @pet.destroy
        redirect_to owner_path
    end

    def prescription 
        @pet = Pet.find(params[:id])
        @prescription = Prescription.find(params[:id])
        render template: 'prescriptions/show'
    end

    def new_prescription
        

    end



    private

    def require_login
        return head(:forbidden) unless session.include? :owner_id
    end

    
    def pet_params
        params.require(:pet).permit(:name, :species, :age, :weight)
    end
    


end