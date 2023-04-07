class LikesController < ApplicationController
  before_action :find_post

  def create
    @like = current_user.likes.build(post: @post)
    if @like.save
      redirect_to [@post.author, @post], notice: 'Liked!'
    else
      redirect_to [@post.author, @post], alert: 'Could not like'
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    redirect_to [@post.author, @post]
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
