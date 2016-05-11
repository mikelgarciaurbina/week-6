class Product < ActiveRecord::Base
  belongs_to :user
  has_many :bids, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def show_winner
    bid_winner = bids.max {|a,b| a.amount <=> b.amount }
    (bid_winner) ? bid_winner.user.name : "None"
  end

  def get_max_bid
    max_bid = bids.max{|a,b| a.amount <=> b.amount }
    max_bid ? max_bid.amount : 0
  end
end
