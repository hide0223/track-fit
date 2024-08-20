class Public::TrainingFavoritesController < ApplicationController
  def create
    @training = Training.find(params[:training_id])
    @training_favorite = current_customer.training_favorites.new(training_id: @training.id)
    @training_favorite.save
  end

  def destroy
    @training = Training.find(params[:training_id])
    @training_favorite = current_customer.training_favorites.find_by(training_id: @training.id)
    @training_favorite.destroy
  end
end
