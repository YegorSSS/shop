class OrdersController < ApplicationController
  def new
  	@order = Order.new

  	if session[:goods_basket] && session[:goods_basket_quantity]
  	  @order.goodsinorders = Array.new
  	  prev_id = 0
  	  session[:goods_basket].sort.each do |good_id|

  	  	if prev_id != good_id
  	  	  @order.goodsinorders << Goodsinorder.new(good_id: good_id, quantity: 1)
  	  	else
  	  	  @order.goodsinorders.last.quantity += 1
  	  	end

  	  	prev_id = good_id

  	  end
    end
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      session.delete(:goods_basket)
      session.delete(:goods_basket_quantity)
      OrderMailer.order_massage(@order).deliver

    else
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :dostavka_id, :payment_id, :mail,
                                  :tel, :address, :detail,
                                  goodsinorders_attributes: [:good_id, :quantity, :order_id])
  end

end
