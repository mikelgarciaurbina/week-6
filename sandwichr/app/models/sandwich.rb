class Sandwich < ActiveRecord::Base
  has_many :sandwich_ingredients
  has_many :ingredients, through: :sandwich_ingredients

  def as_json(options = {})
    super(include: [:ingredients],
      methods: [:total_calories])
  end
  def total_calories
    self.ingredients.reduce(0){|sum, n| sum + n.calories}
  end
end
