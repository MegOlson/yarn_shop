class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :current_bookmark
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  # def current_bookmark
  #   if session[:order_id]
  #     current_user = Order.find(session[:order_id])
  #     current_user.account.bookmarked
  #   end
  # end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit({roles: [] }, :email, :name, :password, :password_confirmation)
      end
    end
end
