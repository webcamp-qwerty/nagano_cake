class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def after_sign_in_path_for(resource)
    if current_admin
      orders_path
    elsebefore_action :authenticate_customer!,except: [:top, :about]
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number])
  end
end
