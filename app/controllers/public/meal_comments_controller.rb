class Public::MealCommentsController < ApplicationController

  def create
    @meal = Meal.find(params[:meal_id])
    @comment = current_customer.meal_comments.new(meal_comment_params)
    @comment.meal_id = @meal.id
    @comment.save
  end

  def destroy
    MealComment.find_by(id: params[:id], meal_id: params[:meal_id]).destroy
  end

  private

  def meal_comment_params
    params.require(:meal_comment).permit(:comment)
  end

end
