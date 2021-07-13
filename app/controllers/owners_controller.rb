class OwnersController < ApplicationController
    #has_secure_password
   

    def new 
        @owner = Owner.new
    end

    def create 
       # binding.pry
        @owner = Owner.new
        @owner.name = params[:name]
        @owner.password = params[:password]
        @owner.email = params[:email]
        @owner.save 
        log_in(@owner)
        redirect_to owner_path(@owner)
    end

    def show 
        #binding.pry
        logged_in?
        @owner = current_user
        @pets = current_user.pets if current_user.pets != nil
    end

    
end
