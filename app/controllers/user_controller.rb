class UserController < ApplicationController
  before_action :is_authenticated
  before_action :get_user, except: [ :new, :create ]
  
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
  
  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :password_confirmation
    )
  end
end