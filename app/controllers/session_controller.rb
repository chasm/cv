class SessionController < ApplicationController
  
  def new
    @title = "Sign In"
    @user = User.new
  end

  def create
  end

  def destroy
  end
end
