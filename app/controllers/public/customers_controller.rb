class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:index]
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def show
    @customer = Customer.find(params[:id])
    @meals = @customer.meals
    @trainings = @customer.trainings
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def index
    redirect_to new_customer_registration_path
  end

  def update
    @customer = Customer.find(params[:id])
    if@customer.update(customer_params)
      flash[:notice] = "変更内容を登録しました"
      redirect_to public_customer_path
    else
       @customer = Customer.find(params[:id])
      render :edit
    end
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to :root
  end

  def meal_favorites
    @customer = Customer.find(params[:id])
    meal_favorites = MealFavorite.where(customer_id: @customer.id).pluck(:meal_id)
    @favorite_meals = Meal.find(meal_favorites)
    training_favorites = TrainingFavorite.where(customer_id: @customer.id).pluck(:training_id)
    @favorite_trainings = Training.find(training_favorites)
  end

  def training_favorites
    @customer = Customer.find(params[:id])
    training_favorites = TrainingFavorite.where(customer_id: @customer.id).pluck(:training_id)
    @favorite_trainings = Training.find(training_favorites)
    meal_favorites = MealFavorite.where(customer_id: @customer.id).pluck(:meal_id)
    @favorite_meals = Meal.find(meal_favorites)
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :email, :introduction, :age, :weight, :height, :profile_image)
  end

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to public_meals_path(current_customer)
    end
  end


end
