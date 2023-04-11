class LikesController < ApplicationController
  before_action :find_post

  def create
    @like = current_user.likes.find_or_initialize_by(post: @post)
    @like.persisted? ? @like.destroy : @like.save
    head :no_content
  end

  def destroy
    @like = current_user.likes.find_by(post: @post)
    if @like
      @like.destroy
    else
      flash[:alert] = 'Could not unlike'
    end
    head :no_content
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
