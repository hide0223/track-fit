class Admin::MealCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @meal_comments = MealComment.all
    @training_comments = TrainingComment.all
    @customers = Customer.all
  end

  def destroy
    @meal_comments = MealComment.find(params[:id])
    @meal_comments.destroy
    redirect_to admin_meal_comments_path
  end
end
