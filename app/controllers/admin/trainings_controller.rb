class Admin::TrainingsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @trainings = Training.all
    @meals = Meal.all
    @customers = Customer.all
  end

  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    redirect_to admin_trainings_path
  end
end
