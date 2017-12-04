require "rails_helper"

describe Product do
  it { should have_many :reviews }
  it { should have_many :order_items }
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should validate_presence_of :on_sale }
  it { should validate_presence_of :stock }
end
