class SiteController < ApplicationController
  before_action :is_authenticated, only: [ :index ]
  
  def index
    @user = current_user
  end
  
  def privacy
    
  end
  
  def terms
    
  end
end