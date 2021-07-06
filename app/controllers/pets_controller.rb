class PetsController < ApplicationController
    def index 
        @pets = Pet.all
        #binding.pry
    end

    def show 
        @pet = Pet.find(params[:id])
    end

    def new 
       
        
    end

    def create 
        @pet = Pet.new
        @pet.name = params[:name]
        @pet.age = params[:age]
        @pet.breed = params[:breed]
        #binding.pry
        @pet.save 
        redirect_to pet_path(@pet)
    end

    


end