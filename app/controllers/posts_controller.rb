class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = @user.posts.new
  end

  def create
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to [@user, @post]
    else
      render :new
    end
  end

  def destroy
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(@user),
                notice: 'Post was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
