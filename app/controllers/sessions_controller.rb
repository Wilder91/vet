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

    def omniauth 
        owner = Owner.from_omniauth(request.env['omniauth.auth'])
        if owner.valid? 
            session[:owner_id] = owner.id
            redirect_to owner_path(owner)
        else 
            redirect_to '/login'
        end
    end
    private 

   
end