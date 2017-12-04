Product.destroy_all

50.times do |index|
  product = Product.create!(name: Faker::Commerce.color, price: Faker::Commerce.price, stock: Faker::Number.between(1, 75))
end

p "Created #{Product.count} products"
