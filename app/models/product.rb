class Product < ActiveRecord::Base
  has_many :order_items
  has_many :reviews
  validates_presence_of :name, :price, :stock
  scope :on_sale, -> { where("on_sale = ?", (true))}
  scope :featured, -> { where("featured = ?", (true))}

end
