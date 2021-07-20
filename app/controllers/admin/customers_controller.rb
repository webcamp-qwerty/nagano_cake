class Admin::CustomersController < ApplicationController
    before_action :if_not_admin

    def index
        @customers = Customer.page(params[:page])
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def edit
        @customer = Customer.find(params[:id])
    end

    def update
        @customer = Customer.find(params[:id])
        if  @customer.update(customer_params)
            redirect_to admin_customer_path(@customer), notice: "会員情報を更新しました"
        else
            render "edit", notice: "会員情報を更新できませんでした"
        end
    end

    private
    def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email, :is_deleted )
    end

    def if_not_admin
    redirect_to root_path unless admin_signed_in?
    end

end
