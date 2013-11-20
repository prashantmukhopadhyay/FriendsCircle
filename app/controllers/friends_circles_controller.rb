class FriendsCirclesController < ApplicationController

  def index
    @all_circles = current_user.friends_circles
    render :index
  end

  def new
    @all_users = User.all
    render :new
  end

  def create
    friend_circle = FriendsCircle.new(params[:friends_circle])
    if friend_circle.save
      friend_circle.member_ids = params[:friend_circle_memberships][:user_id]
      redirect_to friends_circles_url
    else
      flash[:error] = "Try again"
      redirect_to new_friends_circle_url
    end
  end

  def show
    @friends_circle = FriendsCircle.find(params[:id])
    render :show
  end

  def edit
    @friends_circle = FriendsCircle.find(params[:id])
    @all_users = User.all
    render :edit
  end

  def update
    friend_circle = FriendsCircle.find(params[:id])
    friend_circle.member_ids = params[:friend_circle_memberships][:user_id]

    if friend_circle.save
      redirect_to friend_circle
    else
      flash[:error] = "Fix friend circles update"
      redirect_to friend_circle
    end

  end

end
