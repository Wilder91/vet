class SessionsController < ApplicationController
    #before_action :redirect_if_logged_in, only: [:new, :create, :home]
    def new
       
    end

    def create
        @owner = Owner.find_by(email: params[:email])
        if @owner && @owner.authenticate(params[:email]) 
            #binding.pry
            session[:owner_id] = @owner.id
            #binding.pry
            redirect_to @owner
        else
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