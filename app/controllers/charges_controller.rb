class ChargesController < ApplicationController
  def new
  end

  def index

    @orders = Order.where(account_id: current_user.account.id)
  end

  def create
    @amount = ((current_order.total_price) * 100).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Test Order Confirmation',
      :currency    => 'usd',
      :receipt_email => customer.email
    )

    Product.lower_stock(current_order)
    Order.empty_cart(current_order)
    current_order.save

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
