class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :current_bookmark

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
end
