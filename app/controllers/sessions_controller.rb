class SessionsController < ApplicationController

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

end
