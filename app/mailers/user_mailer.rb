class UserMailer < ActionMailer::Base
  default from: "dale+prashant@appacademy.io"

  def password_reset_email(user)
    @user = user
    @url = password_user_url(user.id)
    mail(to: user.email, subject: "Reset Password")
  end

end
