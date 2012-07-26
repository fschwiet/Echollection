class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :current_user

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
    
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end  

  def require_no_user
    if current_user
      #store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to :root
      return false
    end
  end

  def require_user
    if current_user == nil
      store_location
      #flash[:notice] 
      redirect_to new_user_session_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.full_path
  end
end
