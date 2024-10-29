Rails.configuration.stripe = {
  public_key: Rails.application.credentials.dig(:stripe, :public_key),
  secret_key: Rails.application.credentials.dig(:stripe, :secret_key)
}
Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
