class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :account
  # DO NOT VALIDATE TOTAL PRICE
  before_save :update_total
  before_create :update_status

  def self.pass_orders
    Order.where(account: current_user.account.id)
    item_history
    get_products
  end

  def self.item_history
    items = []
    pass_orders.each do |order|
      items.push(order.order_items)
    end
    items
  end

  def self.get_products
    item_history.map do |item|
      item.product.name
    end
  end

  def self.empty_cart(current_order)
    current_order.order_items.destroy_all
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
