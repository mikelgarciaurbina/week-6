module UsersHelper
  def seller_reviews_average(seller_reviews)
    total = seller_reviews.reduce(0) do |result, review|
      result += review.rating
    end
    if seller_reviews.length != 0
      total / seller_reviews.length
    else
      0
    end
  end
end
