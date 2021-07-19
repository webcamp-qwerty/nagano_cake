class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
  end

  def confirm
    @order = Order.new  
    # @cart_items = current_customer.cart_items
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address_option] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @other = params[:order][:addressid]
      @address = Address.find(@other)
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_option] == "2"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      
    end
  end

  def create
  end

  def thanks
  end

  def index
  end

  def show
  end


end
