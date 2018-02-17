ProcessPaymentSchema = Dry::Validation.Schema do
  required(:full_name).filled
  required(:card_number).filled
  required(:card_cvv).filled
  required(:card_expire_date).filled
end