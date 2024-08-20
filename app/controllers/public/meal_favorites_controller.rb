class Public::MealFavoritesController < ApplicationController
  def create
    @meal = Meal.find(params[:meal_id])
    @meal_favorite = current_customer. meal_favorites.new(meal_id: @meal.id)
    @meal_favorite.save
  end

  def destroy
    @meal = Meal.find(params[:meal_id])
    @meal_favorite = current_customer. meal_favorites.find_by(meal_id: @meal.id)
    @meal_favorite.destroy
  end
end
