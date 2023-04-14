class Api::V1::CommentsController < ApplicationController
  before_action :set_user
  before_action :set_post
  before_action :set_comment, only: %i[show update destroy]

  def index
    @comments = @post.comments
    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = @post.comments.new(comment_params)
  end

  def update
    @comment.update(comment_params)
  end

  def destroy
    @comment.destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
