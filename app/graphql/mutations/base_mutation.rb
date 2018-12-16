# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    private

    def mutation_authorize
      yield
      raise GraphQL::ExecutionError, "You don't have permission to do this"
    end
  end
end
