class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    unless @user
      render :no_users_found
    end
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(
  #     name: params[:user][:name],
  #     email: params[:user][:email],
  #     password: params[:user][:password])
  #   if @user.save
  #     redirect_to "/"
  #   else
  #     redirect_to "/users/new"
  #   end
  # end

  # def destroy
  #   user = User.find_by(id: params[:id])
  #   unless user
  #     render :no_users_found
  #   end
  #   user.destroy
  #   redirect_to "/users/new"
  # end

  # def form_login
  # end

  # def login
  #   user = User.find_by(email: params[:user][:email])
  #   unless user
  #     redirect_to "/"
  #   end
  #   if user.password == params[:user][:password]
  #     session[:user_id] = user.id
  #     redirect_to user_show_path(user.id)
  #   else
  #     redirect_to "/"
  #   end
  # end
end
