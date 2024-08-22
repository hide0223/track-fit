class Admin::MealsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @meals = Meal.all
    @trainings = Training.all
    @customers = Customer.all
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to admin_meals_path
  end
end
