module Types
  class MessageType < Types::BaseObject
    implements GraphQL::Relay::Node.interface

    global_id_field :id
    field :body, String, null: true
    field :user, Types::UserType, null: true
    field :own_talk, resolver: Resolvers::UserType::OwnTalkResolver
  end
end
