class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy

    @customer.destroy
    redirect_to admin_customers_path
  end
end
