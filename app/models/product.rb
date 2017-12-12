class Product < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
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
