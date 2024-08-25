class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @range = params[:range]
    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
    elsif @range == "Meal"
      @meals = Meal.looks(params[:search], params[:word])
    elsif @range == "Training"
      @trainings = Training.looks(params[:search], params[:word])
    end
  end

end
