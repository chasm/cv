class PasswordController < ApplicationController
  
  def edit
    @title = "Reset Password"
    
    @user = User.find_by(code: params[:code])
    
    if @user and @user.expires_at > Time.now
      render :edit
    else
      redirect_to login_url, alert: "Reset link has expired. Please try again."
    end
  end

  def update
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(
      :password,
      :password_confirmation
    )
  end
end
