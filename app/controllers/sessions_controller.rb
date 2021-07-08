class SessionsController < ApplicationController
    #before_action :redirect_if_logged_in, only: [:new, :create, :home]
    def new
        @owner = Owner.new
    end

    def log_in
        @current_user = User.find_by(id: session[:user_id])
    end
  
    def log_out
        #binding.pry
        
    end
   

    def destroy
        session.delete(:user_id)
        @current_user = nil
        log_out 
        redirect_to root_path
    end
end