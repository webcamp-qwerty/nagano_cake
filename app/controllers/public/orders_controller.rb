class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
   
    @addresses = @customer.addresses
    @address = Address.new
  end

  def confirm
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
