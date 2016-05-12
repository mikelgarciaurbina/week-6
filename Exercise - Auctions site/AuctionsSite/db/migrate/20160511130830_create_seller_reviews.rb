class CreateSellerReviews < ActiveRecord::Migration
  def change
    create_table :seller_reviews do |t|
      t.references :product, index: true
      t.text :review_content
      t.integer :rating

      t.timestamps null: false
    end
    add_reference :seller_reviews, :author, references: :users
   add_reference :seller_reviews, :subject, references: :users
  end
end
