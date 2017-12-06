class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:welcome]

  def welcome
    @discount_products = Product.on_sale
    @featured_products = Product.featured
    render :welcome
  end

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    @discount_products = Product.on_sale
    @featured_products = Product.featured
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
  end

end
