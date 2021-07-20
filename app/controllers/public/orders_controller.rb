class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
  end

  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items
    @order.delivery_charge = 800
    @order.customer_id = current_customer.id

    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address_option] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @other = params[:order][:address_id]
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
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items
    
   @cart_items.each do |cart_item| 
    @order_item = OrderItem.new
    @order_item.order_id = @order.id
    @order_item.item_id = cart_item.item_id
    @order_item.item_count = cart_item.item_count
    @order_item.purchase_price = cart_item.item.add_tax_price
    @order_item.save
   end 
    current_customer.cart_items.destroy_all
    
    redirect_to order_thanks_path
  end



  def thanks
  end

  def index
    @orders = Order.page(params[:order]).per(8)
  end

  def show
  end

 private
  def order_params
    params.require(:order).permit(:customer_id, :postcode, :address, :name, :payment, :delivery_charge, :payment_method, :order_status)
  end
  # def order_item_params
  #   params.require(:order_item).permit(:item_id, :item_count, :purchase_price, :order_id, :make_status)
  # end


end
