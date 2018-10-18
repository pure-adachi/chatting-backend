module Types
  class ValidationErrorType < Types::BaseObject
    field :field, String, null: false
    field :keys, [String, null: true], null: false
  end
end
