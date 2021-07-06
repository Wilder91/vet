class OwnersController < ApplicationController
    def show 
        @owner = Owner.find(params[:id])
    end

    def new 

    end

    def create 
        #binding.pry
        @owner = Owner.new
        @owner.name = params[:name]
        @owner.password = params[:password]
        @owner.save 
        redirect_to owner_path(@owner)

    end

    def show 
        #binding.pry
        @owner = Owner.find_by(name: current_user.name)
        @pets = Pet.all
        #binding.pry
        #@owner = Owner.find(params[:id])
    end

    def login
        
    end
end
