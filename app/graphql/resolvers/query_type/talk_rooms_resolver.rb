module Resolvers
  module QueryType
    class TalkRoomsResolver < Resolvers::BaseResolver
      type [Types::TalkRoomType], null: false

      argument :group, Boolean, required: false

      def resolve(**args)
        return TalkRoom.all if args[:group].blank?
        TalkRoom.where(group: true)
      end
    end
  end
end
