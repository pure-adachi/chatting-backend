module Resolvers
  module QueryType
    class ViewerResolver < GraphQL::Schema::Resolver
      type Types::UserType, null: true

      def resolve(**_args)
        context[:current_user]
      end
    end
  end
end
