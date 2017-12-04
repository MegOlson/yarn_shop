class ProductsController < ApplicationController

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    @discount_products = Product.on_sale
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
  end


end
