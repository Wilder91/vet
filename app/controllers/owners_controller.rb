class OwnersController < ApplicationController
    #has_secure_password
    #has_secure_password :recovery_password, validations: false
   

    def new 
        @owner = Owner.new
    end

    def create 
       # binding.pry
        @owner = Owner.new
        @owner.name = params[:name]
        @owner.password = params[:password]
        @owner.password_confirmation = params[:password_confirmation]
        @owner.email = params[:email]
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

    def user_params
        params.require(:user).permit(:username, :password_digest)
    end

    
end
