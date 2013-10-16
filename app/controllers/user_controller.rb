class UserController < ApplicationController
  before_action :is_authenticated
  
  def show
    @user = current_user
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
  
  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :password_confirmation
    )
  end
end