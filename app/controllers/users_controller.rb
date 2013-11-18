class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.new(params[:user])
    if user.save
      login_user!
    else
      flash[:error] = "try again"

      redirect_to new_user_url
    end
  end

  def show
    render text: "right place"
  end

end
