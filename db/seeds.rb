Product.destroy_all
Order.destroy_all


5.times do |index|
  product = Product.create!(name: Faker::Commerce.color, price: Faker::Commerce.price, stock: Faker::Number.between(1, 75), image: File.new("app/assets/images/yarn#{index}.jpg"))
end


p "Created #{Product.count} products"
