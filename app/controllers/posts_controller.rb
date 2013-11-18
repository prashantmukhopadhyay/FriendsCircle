class PostsController < ApplicationController
  def new
    render :new
  end

  def create
    @new_post = Post.new(params[:post])

    params[:links].each do |key, value|
      @new_post.links.new(value) unless value.values.last.blank?
    end

    if @new_post.save
      redirect_to new_post
    else
      flash[:error] = "Bad post"
      redirect_to new_post_url
    end

  end

  # def update
  # end

  def destroy
  end
end
