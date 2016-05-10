class CreateSandwichIngredients < ActiveRecord::Migration
  def change
    create_table :sandwich_ingredients do |t|
      t.integer :ingredient_id, index: true
      t.integer :sandwich_id, index: true
      t.timestamps null: false
    end
  end
end
