class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to [@post.author, @post], notice: 'Commented!'
    else
      redirect_to [@post.author, @post], alert: 'Could not comment'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      @post.update(comments_counter: @post.comments_counter - 1)
      redirect_to [@post.author, @post], notice: 'Comment deleted'
    else
      redirect_to [@post.author, @post], alert: 'Could not delete comment'
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text).merge(post: @post)
  end
end
