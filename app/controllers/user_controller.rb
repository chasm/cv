class UserController < ApplicationController
  before_action :is_authenticated
  before_action :get_user
  
  def show
    render json: @user
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
  
  def uuids
    num = (params[:num] || "1").to_i
    
    render :json => { uuids: (0...num).to_a.map { |i| SecureRandom.urlsafe_base64 } }
  end
  
  private
  
  def get_user
    @user = current_user
  end
end