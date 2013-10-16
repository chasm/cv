class UserController < ApplicationController
  before_action :is_authenticated
  before_action :get_user, except: [ :new, :create ]
  before_action :get_registrant, only: [ :new, :create ]
  
  def show
  end
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def get_user
    @user = current_user
  end
  
  def get_registrant
    @registrant = Registrant.find_by(code: params[:code])
    
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