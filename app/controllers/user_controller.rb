class UserController < ApplicationController
  before_action :is_authenticated, except: [ :new, :create ]
  before_action :get_user, except: [ :new, :create ]
  before_action :get_registrant, only: [ :new, :create ]
  
  def show
  end
  
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
  
  def edit
  end
  
  def update
    @user.name = params[:user][:name] if params[:user][:name]
    @user.address = params[:user][:address].split("\n").map(&:strip).reject(&:empty?) if params[:user][:address]
    @user.phone = params[:user][:phone] if params[:user][:phone]
    @user.email = params[:user][:email] if params[:user][:email]
    @user.objective = params[:user][:objective] if params[:user][:objective]
    @user.skills = params[:user][:skills].split("\n").map(&:strip).reject(&:empty?) if params[:user][:skills]
    
    if @user.save
      render :json => @user, status: :ok
    else
      render :json => @user, status: :unprocessable_entity 
    end
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
  
    redirect_to root_url, notice: "An email with instructions for resetting your password has been sent to you."
  end
  
  private
  
  def get_user
    @user = current_user
  end
  
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