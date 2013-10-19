class AwardsController < ApplicationController
  before_action :is_authenticated
  before_action :get_user
  
  respond_to :json
  
  def update
    @award = @user.awards.find_by(id: params[:id])
    
    if @award
      if @award.update_attributes(award_params)
        head :no_content
      else
        render json: @award, status: :unprocessable_entity
      end
    else
      if @award = @user.awards.create(award_params.merge(id: params[:id]))
        head :created
      else
        render json: @award, status: :unprocessable_entity
      end
    end
  end
  
  def destroy
    if @award = @user.awards.find_by(id: params[:id])
      @award.destroy
    end
    
    head :no_content
  end
  
  private
  
  def get_user
    @user = current_user
  end
  
  def award_params
    params.require(:award).permit(:name, :awarded_on)
  end
end