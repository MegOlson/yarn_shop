class Product < ActiveRecord::Base
  has_many :order_items
  has_many :reviews
  validates_presence_of :name, :price, :stock
  scope :on_sale, -> { where("on_sale = ?", (true))}
  scope :featured, -> { where("featured = ?", (true))}

  def self.lower_stock(current_order)
    current_order.order_items.each do |item|
      product = Product.find(item.product_id)
      product.update({stock: product.stock - item.quantity})
    end
  end

end
