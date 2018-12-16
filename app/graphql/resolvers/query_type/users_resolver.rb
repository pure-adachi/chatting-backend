# frozen_string_literal: true

module Resolvers
  module QueryType
    class UsersResolver < Resolvers::BaseResolver
      type [Types::UserType], null: false

      argument :ignore_self, Boolean, required: false

      def resolve(**args)
        return User.all if args[:ignore_self]

        User.where.not(id: context[:current_user].id)
      end
    end
  end
end
