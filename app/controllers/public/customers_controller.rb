class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if@customer.update(customer_params)
      flash[:notice] = "変更内容を登録しました"
      redirect_to public_customer_my_page_path
    else
       @customer = current_customer
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "またのご利用をお待ちしております。"
    redirect_to public_about_path
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :email, :introduction, :age, :weight, :height, :profile_image)
  end

end
