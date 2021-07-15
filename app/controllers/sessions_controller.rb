class SessionsController < ApplicationController
    #before_action :redirect_if_logged_in, only: [:new, :create, :home]
    def new
       
    end

   

    def create
        @owner = Owner.find_by(email: params[:email])
        #binding.pry
        if @owner && @owner.authenticate(params[:password]) 
            log_in(@owner)
            flash[:notice] = "Logged In!"
            redirect_to @owner
        else
             #binding.pry
            flash[:error] = "Password Or Email Address Were Not Found"
            render :new
        end
    end

    

    def destroy
        session.delete(:owner_id)
        current_user = nil
        #binding.pry
        redirect_to root_path
    end

    private 

   
end