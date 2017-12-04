Product.destroy_all
Order.destroy_all

25.times do |index|
  product = Product.create!(name: Faker::Commerce.color, price: Faker::Commerce.price, stock: Faker::Number.between(1, 75))
end

p "Created #{Product.count} products"
