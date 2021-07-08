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
        binding.pry
        @owner = Owner.find_by(name: params[:name])
        @pets = Pet.all
        #binding.pry
        #@owner = Owner.find(params[:id])
    end

    def login
        
    end
end
