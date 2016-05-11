class SandwichViewsController < ApplicationController
  before_action :authenticate_user!
  def index
    @sandwiches = Sandwich.all
  end

  def show
    @sandwich = Sandwich.find(params[:id])
    @ingredients = Ingredient.all
  end
end
