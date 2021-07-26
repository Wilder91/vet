class OwnersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new 
        @owner = Owner.new
    end

    def create 
        @owner = Owner.new(owner_params)
        if @owner.valid?
            @owner.save 
            log_in(@owner)
            redirect_to owner_path(@owner)
        else 
          flash[:error] = "We Are Having Trouble Signing You Up, Please Try Again"
          render '/owners/new'  
        end
    end

    def show 
        if logged_in?
            @owner = current_owner
            @pets = current_owner.pets if current_owner.pets != nil
        else
            redirect_to '/login'
        end
    end

    def alpha_show 
        if logged_in?
            @owner = current_owner
            @pets = current_owner.pets.alpha_pets
            render '/owners/show' 
        else 
            redirect_to '/login'
        end
    end
    def pet 
        @pet = Pet.find_by(id: params[:pet_id])
        @owner = Owner.find_by(id: params[:id])
        if @pet
            render template: 'pets/show'
        else 
            @pet = Pet.new(owner_id: params[:id])
            render template: 'pets/new'
        end
    end

    def new_pet 
        
    end
   
    private
    def owner_params
        params.require(:owner).permit(:name, :password, :password_confirmation, :email)
    end

    
end
