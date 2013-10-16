class SessionController < ApplicationController
  
  def new
    @title = "Sign In"
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    
    if user
      if user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        
        if session[:redirect_to]
          url = session[:redirect_to]
          session[:redirect_to] = nil
          redirect_to url
        else
          redirect_to root_url
        end
      else
        flash.now.alert = "Unable to sign you in. Please try again."
        render :new
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
