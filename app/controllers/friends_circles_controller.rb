class FriendsCirclesController < ApplicationController

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

end
