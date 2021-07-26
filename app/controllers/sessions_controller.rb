class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create, :omniauth] 
    def new
       
    end

   

    def create
        @owner = Owner.find_by(email: params[:email])
        if @owner && @owner.authenticate(params[:password]) 
            log_in(@owner)
            flash[:notice] = "Logged In!"
            redirect_to @owner
        else
              
            flash[:error] = "Password Or Email Address Were Not Found"
            render :new
        end
    end

    

    def destroy
        session.delete(:owner_id)
        current_user = nil
         
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