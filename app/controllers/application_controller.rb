class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_customer!,except: [:top, :about], if: :cus_auth?
  before_action :authenticate_admin!

private
  def cus_auth?
    unless controller_name == 'items' && action_name == 'index'
      true
    end
  end

protected
  def after_sign_in_path_for(resource)
    if current_admin
      orders_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number])
  end
end
