class PasswordMailer < ActionMailer::Base
  default from: "chas@munat.com"

  def reset_email(user)
    @user = user
    
    mail to: @user.email, subject: "ToddyCat: Reset your credentials"
  end
end
