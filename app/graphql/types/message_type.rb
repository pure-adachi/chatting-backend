# frozen_string_literal: true

module Types
  class MessageType < Types::BaseObject
    implements GraphQL::Relay::Node.interface

    global_id_field :id
    field :body, String, null: true
    field :talk_room, Types::TalkRoomType, null: true
    field :user, Types::UserType, null: true
    field :own_talk, resolver: Resolvers::UserType::OwnTalkResolver
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
