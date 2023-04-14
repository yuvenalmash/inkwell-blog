class Api::V1::PostsController < Api::V1::ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: [:show]
  before_action :set_user

  def index
    @posts = @user.posts
    render json: @posts
  end

  def show
    render json: @post
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end
end
