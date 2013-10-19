class ReferencesController < ApplicationController
  before_action :is_authenticated
  before_action :get_user
  
  respond_to :json
  
  def update
    @reference = @user.references.find_by(id: params[:id])
    
    if @reference
      if @reference.update_attributes(reference_params)
        head :no_content
      else
        render json: @reference, status: :unprocessable_entity
      end
    else
      if @reference = @user.references.create(reference_params.merge(id: params[:id]))
        head :created
      else
        render json: @reference, status: :unprocessable_entity
      end
    end
  end
  
  def destroy
    if @reference = @user.references.find_by(id: params[:id])
      @reference.destroy
    end
    
    head :no_content
  end
  
  private
  
  def get_user
    @user = current_user
  end
  
  def reference_params
    params.require(:reference).permit(:name, :email, :phone)
  end
end