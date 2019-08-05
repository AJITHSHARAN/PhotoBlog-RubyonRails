class UserController < ApplicationController
  def signin
  end
  def reset_password
  end
  def reset
  redirect_to posts_url  
  end
  def admin
  end
  
  def signup
    @user = User.new(user_params)
    if @user.save
      @user.set_auth_token
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = "Please confirm your email address to continue"
      redirect_to logon_path
    else
      flash[:error] = "Ooooppss, something went wrong!"
      redirect_to logon_path
    end
  end

  def user_params
  params.permit(:username, :email, :password)  
  end

def confirm_email
    user = User.find_by_auth_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to logon_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to posts_url
    end
end
end