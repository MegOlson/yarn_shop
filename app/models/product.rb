class Product < ActiveRecord::Base
  has_many :order_items
  has_many :reviews
  scope :on_sale, -> { where("on_sale = ?", (true))}
end
