# frozen_string_literal: true

module Types
  class TalkRoomType < Types::BaseObject
    implements GraphQL::Relay::Node.interface

    global_id_field :id
    field :title, String, null: true
    field :group, Boolean, null: true
    field :messages, Types::MessageType.connection_type, null: true, connection: true
    field :users, Types::UserType.connection_type, null: true, connection: true
  end
end
