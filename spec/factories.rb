FactoryBot.define do
  factory(:user) do
    email('test@email.com')
    password('123456')
  end

  factory(:product) do
    price(4.99)
    name("Test")
    stock(10)
  end

  factory(:reviews) do
    content("Test review.")
    user_id(1)
    product_id(1)
  end
end
