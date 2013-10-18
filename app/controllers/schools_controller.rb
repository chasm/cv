class SchoolsController < ApplicationController
  
  def new
    @school = School.new(
      id: SecureRandom.urlsafe_base64,
      address: Address.new(
        id: SecureRandom.urlsafe_base64,
        lines: []
      )
    )
    
    render partial: 'site/school', locals: { s: @school }
  end
end