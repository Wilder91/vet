class OwnersController < ApplicationController
    #has_secure_password
    #has_secure_password :recovery_password, validations: false
   

    def new 
        @owner = Owner.new
    end

    def create 
       #binding.pry
        @owner = Owner.new(owner_params)
        @owner.save 
        log_in(@owner)
        redirect_to owner_path(@owner)
    end

    def show 
        logged_in?
        @owner = current_owner
        #binding.pry
        @pets = current_owner.pets if current_owner.pets != nil
    end

    def pet
        #binding.pry 
        @pet = Pet.find(params[:pet_id])
        render template: 'pets/show'
    end
   
    private
    def owner_params
        params.permit(:name, :password, :password_confirmation, :email)
    end

    
end
