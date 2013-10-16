class SessionController < ApplicationController
  
  def new
    @title = "Sign In"
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    
    if user
      if params[:user][:password].blank?
        user.code = SecureRandom.urlsafe_base64
        user.expires_at = Time.now + 4.hours
        user.save
      
        PasswordMailer.reset_email(user).deliver
        
        flash.now.notice = "An email with instructions for " +
          "resetting your password has been sent to you."
        render :new
      else
        if user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          
          redirect_to root_url
        else
          flash.now.alert = "Unable to sign you in. Please try again."
          render :new
        end
      end
    else
      flash.now.alert = "We cannot find a user with that email address. " +
        "Please check the address and try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "You logged out."
  end
end
