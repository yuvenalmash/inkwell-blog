class Api::V1::UsersController < Api::V1::ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @users
  end
end
