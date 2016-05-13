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
      minimum_bid: params[:product][:minimum_bid],
      buy_now: params[:product][:buy_now])
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

  def buynow
    product = Product.find_by(id: params[:product_id])
    product.deadline = Time.now
    product.save
    amount = product.get_max_bid + 1
    bid = product.bids.new(
        amount: amount,
        user_id: current_user.id)
    bid.save
    redirect_to user_products_show_path(product.user.id, product.id)
  end
end
