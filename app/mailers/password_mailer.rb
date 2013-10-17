class PasswordMailer < ActionMailer::Base
  default from: "chas@munat.com"

  def reset_email(user, request)
    @user = user
    @host = request.protocol + request.host_with_port
    
    mail to: @user.email, subject: "ToddyCat: Reset your credentials"
  end
end
