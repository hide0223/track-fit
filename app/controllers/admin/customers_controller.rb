class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @meals = @customer.meals
    @trainings = @customer.trainings
  end

  def destroy

    @customer.destroy
    redirect_to admin_customers_path
  end
end
