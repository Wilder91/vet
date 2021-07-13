class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception 
    helper_method :current_user, :logged_in? 
    add_flash_types :info, :error, :warnin

    def logged_in?
      !!current_user
    end

    def log_in(owner) 
      session[:owner_id] = owner.id
    end

  

  private


  def current_user
    @current_user ||= Owner.find(session[:owner_id]) if session[:owner_id] 
  end

  def require_logged_in
    redirect_to controller: 'sessions', action: 'new' unless current_user
  end
end
