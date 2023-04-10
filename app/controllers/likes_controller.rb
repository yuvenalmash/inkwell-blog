class LikesController < ApplicationController
  before_action :find_post

  def create
    @like = current_user.likes.find_or_initialize_by(post: @post)
    if @like.persisted?
      @like.destroy
      notice = "You unliked this post"
    elsif @like.save
      notice = "You liked this post"
    else
      notice = "Could not like"
    end
    head :no_content
  end

  def destroy
    @like = current_user.likes.find_by(post: @post)
    if @like
      @like.destroy
      flash[:notice] = "You unliked this post"
    else
      flash[:alert] = "Could not unlike"
    end
    head :no_content
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
