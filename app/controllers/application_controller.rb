class ApplicationController < ActionController::Base
  before_action :customer_search
  before_action :meal_search
  before_action :training_search

   private

  def set_side
    if admin_signed_in?
      @side = 'admin'
    elsif customer_signed_in?
      @side = 'public'
    else
      @side= 'guest'
    end
  end

  def set_aside
    if admin_signed_in?
      @aside = 'admin'
    elsif customer_signed_in?
      @aside = 'public'
    else
      @aside= 'guest'
    end
  end

  def customer_search
    @customer_q = Customer.ransack(params[:q])
    @customer = @customer_q.result(distinct: true)
    @result = params[:customer_q]&.values&.reject(&:blank?)
  end

  def meal_search
    @meal_q = Meal.ransack(params[:q])
    @meal = @meal_q.result(distinct: true)
    @result = params[:meal_q]&.values&.reject(&:blank?)
  end

  def training_search
    @training_q = Training.ransack(params[:q])
    @training = @training_q.result(distinct: true)
    @result = params[:training_q]&.values&.reject(&:blank?)
  end

end
