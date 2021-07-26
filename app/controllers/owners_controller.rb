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
          redirect_to '/owners/new'  
        end
    end

    def show
        #binding.pry 
        if logged_in?
            @owner = current_owner
            @pets = current_owner.pets if current_owner.pets != nil
        else
            redirect_to '/login'
        end
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
