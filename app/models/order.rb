class Order < ActiveRecord::Base
  has_many :order_items
  # DO NOT VALIDATE TOTAL PRICE
  before_save :update_total
  before_create :update_status

  def self.empty_cart(current_order)
    current_order.order_items.destroy_all
  end

  def calculate_total
    # if product.on_sale
    #   product.sale_price = product.price
    # end
    self.order_items.collect { |item| item.product.price * item.quantity }.sum
  end

  private

  def update_status
    if self.status == nil?
      self.status = "In progress"
    end
  end

  def update_total
    self.total_price = calculate_total
  end

end
