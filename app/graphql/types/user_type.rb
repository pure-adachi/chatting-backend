module Types
  class UserType < Types::BaseObject
    implements GraphQL::Relay::Node.interface
    implements InterfaceTypes::ValidationErrorInterface

    global_id_field :id
    field :latest_acess_token, String, null: true
    field :sei, String, null: true
    field :mei, String, null: true
    field :kana_sei, String, null: true
    field :kana_mei, String, null: true
    field :loginid, String, null: true
    field :language, String, null: true
    field :talk_room, resolver: Resolvers::UserType::TalkRoomResolver
  end
end
