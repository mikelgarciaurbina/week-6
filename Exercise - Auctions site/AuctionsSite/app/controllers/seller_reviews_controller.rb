class SellerReviewsController < ApplicationController
  def show
    seller_reviews = SellerReview.where(subject_id: params[:user_id])
    render json: seller_reviews
  end
end
