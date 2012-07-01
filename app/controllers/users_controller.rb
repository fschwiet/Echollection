class UsersController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save 
      redirect_to :root
    else
      render :action => :new
    end
  end
end
