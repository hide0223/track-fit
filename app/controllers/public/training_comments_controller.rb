class Public::TrainingCommentsController < ApplicationController

  def create
    @training = Training.find(params[:training_id])
    @training_comment = current_customer.training_comments.new(training_comment_params)
    @training_comment.training_id = @training.id
    @training_comment.save
  end

  def destroy
    @training_comment = TrainingComment.find_by(id: params[:id], training_id: params[:training_id])
    @training_comment.destroy
  end

  private

  def training_comment_params
    params.require(:training_comment).permit(:comment)
  end

end
