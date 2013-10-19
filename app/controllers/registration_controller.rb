class RegistrationController < ApplicationController
  before_action :get_registrant
  
  def new
    @user = User.new
    @user.email = @registrant.email
  end
  
  def create
    @user = User.new(user_params)
    @user.email = @registrant.email
    
    if @user.save
      session[:user_id] = @user.id
      @registrant.destroy
      redirect_to root_url, notice: "Thank you for registering, #{@user.name}!"
    else
      flash.now.error = "Unable to complete your registration, please check the form."
      render :new
    end
  end
  
  private
  
  def get_registrant
    @registrant = Registrant.find_by(id: params[:code])
    
    unless @registrant && @registrant.expires_at > Time.now
      @registrant.destroy if @registrant
      redirect_to login_url, alert: "Registration link has expired. Please try again."
    end
  end
  
  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :password_confirmation
    )
  end
end