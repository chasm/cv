class JobsController < ApplicationController
  before_action :is_authenticated
  before_action :get_user
  
  respond_to :json
  
  def update
    @job = @user.jobs.find_by(id: params[:id])
    
    if @job
      if @job.update_attributes(job_params)
        head :no_content
      else
        render json: @job, status: :unprocessable_entity
      end
    else
      if @job = @user.jobs.create(job_params.merge(id: params[:id]))
        head :created
      else
        render json: @job, status: :unprocessable_entity
      end
    end
  end
  
  def destroy
    if @job = @user.jobs.find_by(id: params[:id])
      @job.destroy
    end
    
    head :no_content
  end
  
  private
  
  def get_user
    @user = current_user
  end
  
  def job_params
    params.require(:job).permit(
      :name,
      :position,
      :company,
      :address,
      :website,
      :started_on,
      :left_on,
      :duties,
      :reason_for_leaving,
      supervisor: [
        :id,
        :name,
        :phone,
        :email
      ]
    )
  end
end