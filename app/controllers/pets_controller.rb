class PetsController < ApplicationController
    #before_action :require_login

    def index 
        @pets = Pet.all
        #binding.pry
    end

    def show 
        #binding.pry
        @pet = Pet.find(params[:id])
        @prescriptions = Prescription.where(pet_id: @pet.id)
        @owner = current_user
        #binding.pry
    end

    def new 
       
    end

    def create 
        @pet = Pet.new
        @pet.name = params[:name]
        @pet.age = params[:age]
        @pet.breed = params[:breed]
        @pet.species = params[:species]
        @pet.owner = Owner.find_by(id: current_user.id)
        @pet.save
        redirect_to owner_path(@pet.owner)
    end

    def edit 
        @pet = Pet.find(params[:id])
    end

    def update 
        @pet = Pet.find(params[:id])
        @pet.update(name: params[:pet][:name], age: params[:pet][:age], weight: params[:pet][:weight], species: params[:pet][:species])
        redirect_to pet_path(@pet)
    end

    def destroy
        @pet = Pet.find(params[:id]).destroy
        @pet.destroy
        redirect_to owner_path
      end



    private

    def require_login
        return head(:forbidden) unless session.include? :owner_id
    end
    


end