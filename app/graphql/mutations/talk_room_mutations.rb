module TalkRoomMutations
  class Create < Mutations::BaseMutation
    graphql_name 'CreateTalkRoom'

    field :talk_room, Types::TalkRoomType, null: true
    field :result, Boolean, null: true
    argument :user_id, ID, description: 'user.id', required: true

    def ready?(**args)
      mutation_authorize { return true if TalkRoomPolicy.new(context[:current_user], nil).create? }
    end

    def resolve(**args)
      talk_room = TalkRoom.new
      talk_room.users << context[:current_user]
      talk_room.users << User.locate(args[:user_id])
      talk_room.save

      {
        talk_room: talk_room,
        result: talk_room.errors.blank?
      }
    end
  end
end
