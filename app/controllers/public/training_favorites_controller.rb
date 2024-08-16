class Public::TrainingFavoritesController < ApplicationController
  def create
    training = Training.find(params[:training_id])
    training_favorite = current_customer.training_favorites.new(training_id: training.id)
    training_favorite.save
    redirect_to request.referer
  end

  def destroy
    training = Training.find(params[:training_id])
    training_favorite = current_customer.training_favorites.find_by(training_id: training.id)
    training_favorite.destroy
    redirect_to request.referer
  end
end
