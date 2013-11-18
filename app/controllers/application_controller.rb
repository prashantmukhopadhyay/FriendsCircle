class ApplicationController < ActionController::Base
  include SessionsHelper

  before_filter :require_login

  protect_from_forgery

  def require_login
    unless self.current_user
      flash[:error] = "You must be signed in to see this page"
      redirect_to new_session_url
    end
  end
end
