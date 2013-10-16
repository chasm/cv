class SessionController < ApplicationController
  before_action :is_authenticated, only: [ :destroy ]
  
  def new
    @title = "Sign In"
    
    if current_user
      redirect_to root_url
    else
      @user = User.new
    
      render :new
    end
  end

  def create
    if params[:user][:password].blank?
      user = User.find_by(email: params[:user][:email])
    
      if user
        user.code = SecureRandom.urlsafe_base64
        user.expires_at = Time.now + 4.hours
        user.save
    
        PasswordMailer.reset_email(user).deliver
      
        flash.now.notice = "An email with instructions for " +
          "resetting your password has been sent to you."
        render :new
      else
        registrant = Registrant.create(email: params[:user][:email])
        
        if registrant
          UserMailer.registration_email(registrant).deliver
      
          flash.now.notice = "An email with instructions for " +
            "completing your registration has been sent to you."
          render :new
        else
          flash.now.alert = "Unable to register you. Please try again."
          render :new
        end
      end
    else
      if user = User.authenticate(params[:user][:email], params[:user][:password])
        session[:user_id] = user.id
        
        redirect_to root_url
      else
        flash.now.alert = "Unable to sign you in. Please try again."
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "You logged out."
  end
end
