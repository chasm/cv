class UserMailer < ActionMailer::Base
  default from: "chas@munat.com"

  def registration_email(registrant, request)
    @registrant = registrant
    @host = request.protocol + request.host_with_port
    
    mail to: @registrant.email, subject: "ToddyCat: Complete your registration"
  end
end
