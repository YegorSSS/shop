class SessionsController < ApplicationController
  def display
  	session[:display] = params[:display] if params[:display]
  	redirect_to :back
  end

  def basket
  	session[:goods_basket] = [] unless session[:goods_basket]

  	if params[:good_id]
      session[:goods_basket] << params[:good_id]
      prices = session[:goods_basket].map {|id| Good.find(id).price}
      session[:goods_basket_quantity] = prices.inject {|sum, price| sum + price.to_i}
    end
    redirect_to :back
  end

  def basket_update
    if params[:good_id]
      session[:goods_basket].delete(params[:good_id])
      prices = session[:goods_basket].map {|id| Good.find(id).price}
      session[:goods_basket_quantity] = prices.inject {|sum, price| sum + price.to_i}
    end
    redirect_to :back
  end

  def new
  end

  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer && customer.authenticate(params[:session][:password])
      sign_in_customer customer
      redirect_to root_url
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out_customer
    redirect_to root_url
  end

  def sort_goods
    session[:sort_goods] = params[:sort_goods] if params[:sort_goods]
    redirect_to :back
  end
end