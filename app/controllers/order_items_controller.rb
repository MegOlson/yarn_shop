class OrderItemsController < ApplicationController

  def create
    if params[:commit] == "Save for Later"
      @order = current_bookmark
      @message = "Item saved for later."
    elsif params[:commit] == "Add to cart"
      @order = current_order
      @message = "Item added to Cart."
    end
    @item = @order.order_items.new(item_params)
    if @order.save
      session[:order_id] = @order.id
      flash[:notice] = @message
    end
    redirect_to products_path
  end


  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

private
  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
