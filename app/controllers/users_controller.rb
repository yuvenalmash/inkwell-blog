class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def index_posts
    @posts = Post.where(user_id: params[:user_id])
  end

  def show_post
    @post = Post.find(params[:id])
  end
end
