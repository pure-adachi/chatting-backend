module Types
  class MutationType < Types::BaseObject
    field :login, mutation: UserMutations::Login
    field :create_message, mutation: MessageMutations::Create
    field :create_talk_room, mutation: TalkRoomMutations::Create
  end
end
