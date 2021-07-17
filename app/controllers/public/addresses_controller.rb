class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.all
    @address = Address.new
    @customer = current_customer
  end

  def create
    @addresses = Address.all
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
      flash[:notice] = "新しい配送先を追加しました"
    else
      @customer = current_user
      render "index"
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送先を更新しました"
      redirect_to addresses_path
    else
      render "edit"
    end
  end

  private
  def address_params
    params.require(:address).permit(:postcode, :address, :name)
  end

end
