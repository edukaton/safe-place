NewClassroomSchema = Dry::Validation.Schema do
  required(:name).filled
end