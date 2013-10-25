class AuthenticationsController < ApplicationController
	before_action :authenticate_user, only: [:destroy]

  def new
    # session[:user_id] = User.first.id
    # Are they already logged in?
    if current_user
      redirect_to users_url
    else
      @user = User.new(username: params[:username])
      render :new
    end
  end

 def create
    user = User.where(username: params[:user][:username]).first

    if user
        # authenticate user
        if user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect_to users_url
        else
          flash.now.alert = "Unable to sign you in. Please try again."
          redirect_to users_new_url
        end
    else
      redirect_to users_new_url(username: params[:user][:username])
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to authentications_url, notice: "You signed out."
  end

end