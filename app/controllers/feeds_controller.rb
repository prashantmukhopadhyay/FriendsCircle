class FeedsController < ApplicationController
  def show
    @all_posts = current_user.received_posts
    fail
    render :show
  end
end
