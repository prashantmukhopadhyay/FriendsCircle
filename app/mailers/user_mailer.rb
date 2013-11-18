class UserMailer < ActionMailer::Base
  default from: "dale+prashant@appacademy.io"

  def password_reset_email(user)
    @user = user
    @url = password_users_url + "?auth_token=#{user.auth_token}"
    mail(to: user.email, subject: "Reset Password")
  end

end
