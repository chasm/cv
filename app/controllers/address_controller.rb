class AddressController < ApplicationController
  before_action :is_authenticated
  
  def update
    render json: current_user
  end
end