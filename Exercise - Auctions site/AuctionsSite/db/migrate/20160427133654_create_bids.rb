class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
