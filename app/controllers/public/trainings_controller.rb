class Public::TrainingsController < ApplicationController


  def index
    @records = @content.records
    @meal = Meal.new
    @training = Training.new
  end

  def create
    @records = @content.records.new(records_params)
    if @records.save
      redirect_to public_records_path
    else
      render :index
    end
  end
end
