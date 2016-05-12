class SellerReview < ActiveRecord::Base
  belongs_to :subject, class_name: :User
  belongs_to :author, class_name: :User
end
