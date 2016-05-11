class ProductsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    unless @user
      render :no_users_found
    end
    @products = @user.products
  end

  def show
    @user = User.find_by(id: params[:user_id])
    unless @user
      render :no_users_found
    end
    @product = @user.products.find_by(id: params[:id])
    @bids = @product.bids
  end

  def new
    @user = User.find_by(id: params[:user_id])
    unless @user
      render :no_users_found
    end
    @product = @user.products.new
  end

  def create
    @user = User.find_by(id: params[:user_id])
    unless @user
      render :no_users_found
    end
    @product = @user.products.new(
      title: params[:product][:title],
      description: params[:product][:description],
      deadline: params[:product][:deadline],
      minimum_bid: params[:product][:minimum_bid])
    if @product.save
      redirect_to user_products_path(@user.id)
    else
      render "new"
    end
  end

  def destroy
    user = User.find_by(id: params[:user_id])
    unless user
      render :no_users_found
    end
    product = user.products.find_by(id: params[:id])
    product.destroy
    redirect_to user_products_path(user.id)
  end
end
