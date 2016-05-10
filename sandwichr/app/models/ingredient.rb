class Ingredient < ActiveRecord::Base
  has_many :sandwich_ingredients
  has_many :sandwich, through: :sandwich_ingredients
end
