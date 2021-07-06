class PetsController < ApplicationController
    def index 
        @pets = Pet.all
        #binding.pry
    end

    def show 
        @pet = Pet.find(params[:id])
        @owner = Owner.find_by(id: current_user.id)
    end

    def new 
       
        
    end

    def create 
        #binding.pry
        @pet = Pet.new
        @pet.name = params[:name]
        @pet.age = params[:age]
        @pet.breed = params[:breed]
        @pet.owner = Owner.find_by(id: current_user.id)
        @pet.save
        #binding.pry
        redirect_to pet_path(@pet)
    end

    


end