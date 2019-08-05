class AuthController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      if user.email_confirmed
        session[:user_id] = user.id
        flash[:success] = "You have successfully logged in"
        redirect_to posts_path
      end  
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end
  def logout
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to logon_path
  end
end
