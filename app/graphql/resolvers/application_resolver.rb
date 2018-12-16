# frozen_string_literal: true

module Resolvers
  class ApplicationResolver < GraphQL::Schema::Resolver
    def self.accessible?(context)
      context[:current_user].present?
    end
  end
end
