class CustomersController < ApplicationController
  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.new(customer_params)
  	if @customer.save
      sign_in_customer @customer
      flash[:success] = "Добро пожаловать!"
      redirect_to goods_path
    else
      render 'new'
    end
  end

  private

    def customer_params
      params.require(:customer).permit(:name, :email, :password,
                                   :login, :tel, :address)
    end
end
