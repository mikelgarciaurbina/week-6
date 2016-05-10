class Api::V1::UsersController < ApplicationController

  before_action :user_exists, except: [:index, :create]

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create(user_params)
    render json: user, status: 201
  end

  def show
    render json: user
  end

  def update
    user.update(user_params)
    render json: user
  end

  def destroy
    user.destroy
    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def user_exists
    @user = User.find_by(id: params[:id])
    unless @user
      render json: { error: "user not found"}, status: 400
      return
    end
  end
end