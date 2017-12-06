class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :account
  # DO NOT VALIDATE TOTAL PRICE
  before_save :update_total
  before_create :update_status
  # before_destroy :remove_items
  scope :placed, -> { where("status = 'Placed'")}

  def self.empty_cart(current_order)
    current_order.order_items.destroy_all
  end

  def remove_items
    OrderItem.where(order: self).each do |item|
      item.destroy
    end
  end

  def lower_stock
    OrderItem.where(order: self).each do |item|
      item.product.update(stock: item.product.stock - item.quantity)
    end
  end

  def calculate_total
    amount = self.order_items.collect do |item|
      if item.product.on_sale
        item.product.sale_price * item.quantity
      else
        item.product.price * item.quantity
      end
    end
    amount.sum
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
