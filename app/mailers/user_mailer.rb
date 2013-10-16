class UserMailer < ActionMailer::Base
  default from: "chas@munat.com"

  def registration_email(registrant)
    @registrant = registrant
    
    mail to: @registrant.email, subject: "ToddyCat: Complete your registration"
  end
end
