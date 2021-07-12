class OwnersController < ApplicationController
    #has_secure_password
   

    def new 
        @owner = Owner.new
    end

    def create 
        #binding.pry
        @owner = Owner.new
        @owner.name = params[:name]
        @owner.password = params[:password]
        @owner.email = params[:email]
        #binding.pry
        @owner.save 
        redirect_to owner_path(@owner)

    end

    def show 
        logged_in?
        @owner = current_user
        @pets = current_user.pets
    end

    
end
