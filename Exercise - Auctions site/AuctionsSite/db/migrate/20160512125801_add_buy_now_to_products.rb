class AddBuyNowToProducts < ActiveRecord::Migration
  def change
    add_column :products, :buy_now, :integer
  end
end
