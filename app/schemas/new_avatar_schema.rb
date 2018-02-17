NewAvatarSchema = Dry::Validation.Schema do
  required(:classroom_code).filled
  required(:gender).value(included_in?: ["male", "female"])
end