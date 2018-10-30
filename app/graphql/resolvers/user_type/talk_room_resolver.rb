module Resolvers
  module UserType
    class TalkRoomResolver < Resolvers::BaseResolver
      type Types::TalkRoomType, null: true

      def resolve(**_args)
        object.talk_rooms.joins(:users).find_by("users.id": context[:current_user].id)
      end
    end
  end
end
