class LikesController < ApplicationController
  before_action :find_post

  def create
    @like = current_user.likes.build(post: @post)
    if @like.save
      # render json: { likes_count: @post.likes_counter }
      head :no_content
    else
      render json: { error: "Could not like" }, status: :unprocessable_entity
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
