class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update]

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if@customer.update(customer_params)
      flash[:notice] = "変更内容を登録しました"
      redirect_to public_customer_my_page_path
    else
       @customer = Customer.find(params[:id])
      render :edit
    end
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "またのご利用をお待ちしております。"
    redirect_to public_about_path
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :email, :introduction, :age, :weight, :height, :profile_image)
  end

   def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to public_meals_path(current_customer)
    end
  end


end
