module Resolvers
  module UserType
    class OwnTalkResolver < Resolvers::BaseResolver
      type Boolean, null: true

      def resolve(**_args)
        object.user_id == context[:current_user].id
      end
    end
  end
end
