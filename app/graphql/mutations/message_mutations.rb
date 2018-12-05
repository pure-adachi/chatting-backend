module MessageMutations
  class Create < Mutations::BaseMutation
    graphql_name 'CreateMessage'

    field :message, Types::MessageType, null: true
    field :result, Boolean, null: true

    argument :talk_room_id, ID, description: 'talk_rooms.id', required: true
    argument :body, String, required: false

    def ready?(**args)
      mutation_authorize { return true if MessagePolicy.new(context[:current_user], TalkRoom.locate(args[:talk_room_id])).create? }
    end

    def resolve(**args)
      talk_room = TalkRoom.locate(args[:talk_room_id])
      message = talk_room.messages.new(user_id: context[:current_user].id, body: args[:body].chomp)
      message.save

      {
        message: message,
        result: message.errors.blank?
      }
    end
  end
end
