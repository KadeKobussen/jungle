Rails.configuration.stripe = {
  :publishable_key => "pk_test_51N3q5CBPPDhyCE0ETbSGtpRHrWXpFwFxv6UJFW9Yg7b1GftoS9eZuO0EN9RtCsSuOpGmT76qSrXVRDI1nRFlUZRH00ikAZWQjG",
  :secret_key      => "sk_test_51N3q5CBPPDhyCE0EXaMAH3YHyXlOVHcgPXVq8glIxCrmBLBAtPUL12yieN4eXCOxCVyXbMMxVLWqEdPj9GnsxtsX00uvKAKje8"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
