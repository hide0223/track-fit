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

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
        redirect_to admin_customer_path(@customer.id)
    else
        render "edit"
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to admin_customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :introduction, :age, :weight, :height, :profile_image, :is_active)
  end
end
