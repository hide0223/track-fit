class Public::MealsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def index
    @meals = Meal.all.order(created_at: :desc)
    @meal = Meal.new
    @customers = Customer.all
    @meal.meal_contents.build
    @trainings = Training.all.order(created_at: :desc)
    @training = Training.new
    @training.training_contents.build
  end


  def show
    @meal = Meal.find(params[:id])
    @meal_comment = MealComment.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.customer_id = current_customer.id
    if @meal.save
      redirect_to public_meals_path
    else
      @meals = Meal.all
      @meal.meal_contents.build
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
    @meal.meal_contents.build
  end

  def update
     @meal = Meal.find(params[:id])
    if @meal.update(meal_params)
      redirect_to public_meal_path(@meal)
    else
      render "edit"
    end
  end

  def search
    selection = params[:meal][:keyword]
    if selection == 'likes'
      @meals = Meal.includes(:meal_favorites).sort {|a,b| b.meal_favorites.size <=> a.meal_favorites.size}
    else
      @meals = Meal.includes(:meal_favorites).sort {|a,b| a.meal_favorites.size <=> b.meal_favorites.size}
    end
  end

    private

  def meal_params
    params.require(:meal).permit(:category, :body_weight, :body, :image,
    meal_contents_attributes: [:id, :meal_summary, :eat_meal, :kcal, :_destroy])
  end

  def ensure_correct_customer
    @meal = Meal.find(params[:id])
    unless @meal.customer == current_customer
      redirect_to public_meals_path
    end
  end

end
