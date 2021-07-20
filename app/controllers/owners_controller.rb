class OwnersController < ApplicationController

    def new 
        @owner = Owner.new
    end

    def create 
        @owner = Owner.new(owner_params)
        @owner.save 
        log_in(@owner)
        #binding.pry
        redirect_to owner_path(@owner)
    end

    def show 
        logged_in?
        @owner = current_owner
        @pets = current_owner.pets if current_owner.pets != nil
    end

    def pet 
        @pet = Pet.find(params[:pet_id])
        render template: 'pets/show'
    end
   
    private
    def owner_params
        params.require(:owner).permit(:name, :password, :password_confirmation, :email)
    end

    
end
