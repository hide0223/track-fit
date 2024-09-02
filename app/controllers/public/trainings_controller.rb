class Public::TrainingsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def index
    @trainings = Training.active_customers.order(created_at: :desc)
    @training = Training.new
    @training.training_contents.build
    @meals = Meal.all.order(created_at: :desc)
    @meal = Meal.new
    @meal.meal_contents.build
    @customers = Customer.all
  end


  def show
    @training = Training.find(params[:id])
    @training_comment = TrainingComment.new
  end

  def create
    @training = Training.new(training_params)
    @training.customer_id = current_customer.id
    if @training.training_contents.present? && @training.save
      redirect_to public_trainings_path
    else
      @trainings = Training.all
      @training.training_contents.build
      render 'index'
    end
  end

  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    redirect_to public_trainings_path

  end

  def edit
    @training = Training.find(params[:id])
  end

  def update
     @training = Training.find(params[:id])
    if @training.update(training_params)
      redirect_to public_training_path(@training)
    else
      render "edit"
    end
  end

  def search
    selection = params[:training][:keyword]
    if selection == 'likes'
      @trainings = Training.includes(:training_favorites).sort {|a,b| b.training_favorites.size <=> a.training_favorites.size}
    else
      @trainings = Training.includes(:training_favorites).sort {|a,b| a.training_favorites.size <=> b.training_favorites.size}
    end
  end

    private

  def training_params
    params.require(:training).permit(:body_weight, :body, :image,
    training_contents_attributes: [:id, :body_parts, :exercise, :weight, :sets, :reps, :_destroy])
  end

  def ensure_correct_customer
    @training = Training.find(params[:id])
    unless @training.customer_id == current_customer.id
      redirect_to public_trainings_path
    end
  end

end
