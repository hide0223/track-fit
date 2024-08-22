class Admin::TrainingCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @training_comments = TrainingComment.all
    @meal_comments = MealComment.all
    @customers = Customer.all
  end

  def destroy
    @training_comments = TrainingComment.find(params[:id])
    @training_comments.destroy
    redirect_to admin_training_comments_path
  end
end
