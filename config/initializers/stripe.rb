Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_qvgd3JYD9jF8jv7u81CgSHWj'],
  :secret_key      => ENV['sk_test_7wHwoEGnDKSW2Z3x41RjLvXM']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
