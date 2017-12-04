class Product < ActiveRecord::Base
  has_many :order_items
  has_many :reviews
  validates_presence_of :name, :price, :on_sale, :stock
  scope :on_sale, -> { where("on_sale = ?", (true))}
end
