class Public::TrainingsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def index
    @trainings = Training.all
    @training = Training.new
  end


  def show
    @training = Training.find(params[:id])
  end

  def create
    @training = Training.new(training_params)
    @training.customer_id = current_customer.id
    if @training.save
      redirect_to public_trainings_path
    else
      @trainings = Training.all
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

    private

  def training_params
    params.require(:training).permit(:body_parts, :exercise, :weight, :sets, :reps, :body)
  end

  def ensure_correct_customer
    @training = Training.find(params[:id])
    unless @training.customer_id == current_customer.id
      redirect_to public_trainings_path
    end
  end

end
