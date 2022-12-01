Rails.configuration.stripe = {
  :publishable_key => 'pk_test_51M2bQOEdMYtPZIQqPIlgbiJhZ8mHLaO8M9ThQRKN4Jzuta8PMUAKUTh1GKLRCNwQvIQjeH9Vcm9iOOLuaSVY1N3G00fvRn3ao4',
  :secret_key      => 'sk_test_51M2bQOEdMYtPZIQqSrCAxF0iOCPKXE59juIsPzzOnJeEMaCwJLPwjZZoDSH2gjjLFEyprSUh8N15it1VaA7V6u5B00VeH3PElD'
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]