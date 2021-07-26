class ApplicationController < ActionController::Base
    before_action :require_login
    protect_from_forgery with: :exception 
    helper_method :current_owner
    helper_method :logged_in? 
    add_flash_types :info, :error, :warning

    def logged_in?
      !!current_owner
    end

    def log_in(owner) 
      session[:owner_id] = owner.id
    end

  private


  def current_owner
    @current_owner ||= Owner.find(session[:owner_id]) if session[:owner_id] 
  end

  def require_login
    return head(:forbidden) unless session.include? :owner_id
  end


end
