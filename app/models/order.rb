class Order < ActiveRecord::Base
  has_many :order_items
  validates_presence_of :total_price
  before_save :update_total
  before_create :update_status

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
