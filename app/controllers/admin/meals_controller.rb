class Admin::MealsController < ApplicationController
  def index
    @meals = Meal.all
    @customers = Customer.all
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to admin_meals_path
  end

end
