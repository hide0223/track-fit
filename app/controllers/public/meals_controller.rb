class Public::MealsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def index
    @meals = Meal.all.order(created_at: :desc)
    @meal = Meal.new
  end


  def show
    @meal = Meal.find(params[:id])
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.customer_id = current_customer.id
    if @meal.save
      redirect_to public_meals_path
    else
      @meals = Meal.all
      render 'index'
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to public_meals_path

  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
     @meal = Meal.find(params[:id])
    if @meal.update(meal_params)
      redirect_to public_meal_path(@meal)
    else
      render "edit"
    end
  end

    private

  def meal_params
    params.require(:meal).permit(:category, :meal_summary, :eat_meal, :kcal, :body, :image)
  end

  def ensure_correct_customer
    @meal = Meal.find(params[:id])
    unless @meal.customer == current_customer
      redirect_to public_meals_path
    end
  end

end
