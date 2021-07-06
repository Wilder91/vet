class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

  def login 

  end

  

  private


  def current_user
    @current_user ||= Owner.find(session[:owner_id]) if session[:owner_id]  #@current_user is equal to the instance
  end

  def require_logged_in
    redirect_to controller: 'sessions', action: 'new' unless current_user
  end
end
