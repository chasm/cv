class SchoolsController < ApplicationController
  before_action :is_authenticated
  before_action :get_user
  
  respond_to :json
  
  def update
    @school = @user.schools.find_by(id: params[:id])
    
    if @school
      if @school.update_attributes(school_params)
        head :no_content
      else
        render json: @school, status: :unprocessable_entity
      end
    else
      if @school = @user.schools.create(school_params.merge(id: params[:id]))
        head :created
      else
        render json: @school, status: :unprocessable_entity
      end
    end
  end
  
  def destroy
    if @school = @user.schools.find_by(id: params[:id])
      @school.destroy
    end
    
    head :no_content
  end
  
  private
  
  def get_user
    @user = current_user
  end
  
  def school_params
    params.require(:school).permit(
      :name,
      :address,
      :started_on,
      :left_on,
      :highest_grade_completed,
      :graduated,
      :awards,
      :activities
    )
  end
end