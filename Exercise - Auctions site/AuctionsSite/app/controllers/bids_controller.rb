class BidsController < ApplicationController
  def create
    amount = params[:bid][:amount].to_i
    @user = User.find_by(email: params[:bid][:email])
    unless @user
      render :no_users_found
    end
    @product = Product.find_by(id: params[:product_id])
    if amount > @product.minimum_bid &&
        amount > @product.get_max_bid &&
        @product.user.id != @user.id
      @bid = @product.bids.new(
        amount: params[:bid][:amount],
        user_id: @user.id)
      @bid.save
    end
    redirect_to user_products_show_path(@product.user.id, @product.id)
  end
end
