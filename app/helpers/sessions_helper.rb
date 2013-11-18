module SessionsHelper

  def login_user!
    self.current_user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    redirect_to current_user
  end

  def current_user
    return nil if session[:session_token].nil?

    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def current_user=(user)
    @current_user = user

    session[:session_token] = @current_user.session_token
  end

end
