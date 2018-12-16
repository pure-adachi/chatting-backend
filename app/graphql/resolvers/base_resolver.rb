# frozen_string_literal: true

module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    def self.accessible?(context)
      context[:current_user].present?
    end
  end
end
