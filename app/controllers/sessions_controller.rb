class SessionsController < ApplicationController
    #before_action :redirect_if_logged_in, only: [:new, :create, :home]
    def new
       
    end

    def fb_create 
        binding.pry
        @owner = Owner.find_or_create_by(email: auth["info"]["email"])
        if !@owner.password
            @owner.password = SecureRandom.hex
        end
        @owner.save
        log_in(@owner)
        redirect_to dashboard_path
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

    def auth
        request.env['omniauth.auth']
    end
end