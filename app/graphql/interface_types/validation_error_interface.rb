# frozen_string_literal: true

module InterfaceTypes
  module ValidationErrorInterface
    include Types::BaseInterface
    graphql_name 'ValidateError'

    field :errors, [Types::ValidationErrorType, null: true], null: true
    def errors
      details = object.errors.details.keys.map do |key|
        [key, object.errors.details[key].flat_map { |detail| detail[:error] }.compact]
      end.to_h
      details.map do |key, value|
        ValidationError.new(key, value)
      end
    end
  end
end
