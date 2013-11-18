class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:new, :create, :update, :password]


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
    render :show
  end

  def password
    @user = User.find(params[:id])

    render :password
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to new_session_url
    else
      flash[:error] = "invalid password choice"

      redirect_to password_user_url(params[:id])
    end
  end

end
