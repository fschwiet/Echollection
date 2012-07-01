class UserSessionsController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  
  def new
  	@user_session = UserSession.new
  end

  def create
  	@user_session = UserSession.new(params[:user_session])
  	if @user_session.save
  	  redirect_to :root
    else
      render :action => :new
    end
  end
end
