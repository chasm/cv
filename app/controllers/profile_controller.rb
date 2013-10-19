class ProfileController < ApplicationController
  before_action :is_authenticated
  before_action :get_user
  
  def show
  end
  
  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "You have deleted your account."
  end
  
  def update_password
    @user.code = SecureRandom.urlsafe_base64
    @user.expires_at = Time.now + 4.hours
    @user.save

    PasswordMailer.reset_email(@user, request).deliver
  
    redirect_to profile_url, notice: "An email with instructions for resetting your password has been sent to you."
  end
  
  private
  
  def get_user
    @user = current_user
  end
end