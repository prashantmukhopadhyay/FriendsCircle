class SessionsController < ApplicationController

  skip_before_filter :require_login, only: [:new, :create, :email, :send_email]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if user
      login_user!
    else
      flash[:error] = "invalid email/password combination"

      redirect_to new_session_url
    end
  end

  def destroy
    session[:session_token] = @current_user = nil

    redirect_to new_session_url
  end

  def email
    render :email
  end

  def send_email
    u = User.find_by_email(params[:user][:email])
    msg = UserMailer.password_reset_email(u)
    msg.deliver!
    redirect_to new_session_url
  end

end
