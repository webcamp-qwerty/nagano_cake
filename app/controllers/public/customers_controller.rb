class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if  @customer.update(customer_params)
        redirect_to customers_path, notice: "会員情報を更新しました"
    else
      render "edit", notice: "会員情報を更新できませんでした"
    end
  end

  def confirm
  end

  def hide
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email )
  end
end
