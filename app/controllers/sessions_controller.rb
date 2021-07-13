class SessionsController < ApplicationController
    #before_action :redirect_if_logged_in, only: [:new, :create, :home]
    def new
       
    end

    def create
        @owner = Owner.find_by(email: params[:email])
        #binding.pry
        if @owner #&& @owner.authenticate(params[:email]) 
            session[:owner_id] = @owner.id
            flash[:notice] = "Logged In!"
            redirect_to @owner
            
        else
            flash[:alert] = "NOPE"
            render :new
        end
    end

    def destroy
        session.delete(:owner_id)
        current_user = nil
        #binding.pry
        redirect_to root_path
    end
end