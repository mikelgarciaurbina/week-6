class ReviewsController < ApplicationController
  def create
    @review = Review.new(
      description: params[:review][:description],
      user_id: params[:review][:user_id],
      product_id: params[:review][:product_id])
    @review.save
    redirect_to user_products_show_path(params[:review][:user_id], params[:review][:product_id])
  end

  def edit
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @review = Review.find(params[:id])
  end

  def update
    binding.pry
    review = Review.find(params[:id])
    unless current_user.id == review.user.id
      respond_to do |format|
        format.html { redirect_to reviews, notice: 'You dont have permission to edit this review.' }
      end
    end
    review.description = params[:review][:description]
    review.save
    redirect_to reviews
  end
end
