module Types
  class TalkRoomType < Types::BaseObject
    implements GraphQL::Relay::Node.interface

    global_id_field :id
    field :messages, Types::MessageType.connection_type, null: true, connection: true
  end
end
