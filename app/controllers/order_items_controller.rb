class OrderItemsController < ApplicationController

  def create
    if params[:commit] == "Save for Later"
      @order = current_bookmark
      @message = "Item saved for later."
    elsif params[:commit] == "Add to cart"
      @order = current_order
      @order.update(account_id: current_user.account.id)
      @message = "Item added to Cart."
    end
    @item = @order.order_items.new(item_params)
    if @item.product.stock < 1
      flash[:notice] = "Out of stock."
    elsif @item.product.stock < @item.quantity
      flash[:notice] = "We don't have enough in stock for this order."
    else
      if @order.save
        session[:order_id] = @order.id
        flash[:notice] = @message
      end
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
