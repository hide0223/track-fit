class Public::MealCommentsController < ApplicationController

  def create
    @meal = Meal.find(params[:meal_id])
    @meal_comment = current_customer.meal_comments.new(meal_comment_params)
    @meal_comment.meal_id = @meal.id
    @meal_comment.save
  end

  def destroy
    @meal_comment = MealComment.find_by(id: params[:id], meal_id: params[:meal_id])
    @meal_comment.destroy
  end

  private

  def meal_comment_params
    params.require(:meal_comment).permit(:comment)
  end

end
