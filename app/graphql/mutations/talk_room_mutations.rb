module TalkRoomMutations
  class Create < Mutations::BaseMutation
    graphql_name 'CreateTalkRoom'

    field :talk_room, Types::TalkRoomType, null: true
    field :result, Boolean, null: true
    argument :title, String, description: 'title', required: false
    argument :group, Boolean, description: 'group flag', required: false
    argument :user_ids, [ID, null: true], description: 'users.id', required: true

    def ready?(**args)
      mutation_authorize { return true if TalkRoomPolicy.new(context[:current_user], nil).create? }
    end

    def resolve(**args)
      talk_room = TalkRoom.new(args.slice(:title, :group))
      talk_room.users << context[:current_user]
      talk_room.users += User.plural_locate(args[:user_ids])
      talk_room.save

      {
        talk_room: talk_room,
        result: talk_room.errors.blank?
      }
    end
  end
end
