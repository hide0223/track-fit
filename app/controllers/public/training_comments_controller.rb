class Public::TrainingCommentsController < ApplicationController
  
  def create
    training = Training.find(params[:training_id])
    comment = current_customer.training_comments.new(training_comment_params)
    comment.training_id = training.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    TrainingComment.find_by(id: params[:id], training_id: params[:training_id]).destroy
    redirect_to request.referer
  end

  private
  
  def training_comment_params
    params.require(:training_comment).permit(:comment)
  end
  
end
