class OwnersController < ApplicationController
    #has_secure_password
    #has_secure_password :recovery_password, validations: false
   

    def new 
        @owner = Owner.new
    end

    def create 
        @owner = Owner.new(owner_params)
        if @owner.save 
            log_in(@owner)
            redirect_to owner_path(@owner)
        else
            render :new 
        end
    end

    def show 
        logged_in?
    end

    private
    def owner_params
        params.require(:owner).permit(:name, :password, :password_confirmation, :email)
    end

    
end
