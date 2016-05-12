module UsersHelper
  def seller_reviews_average(seller_reviews)
    total = seller_reviews.reduce(0) do |result, review|
      result += review.rating
    end
    total / seller_reviews.length
  end
end
