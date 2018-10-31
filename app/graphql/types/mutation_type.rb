module Types
  class MutationType < Types::BaseObject
    field :login, mutation: UserMutations::Login
    field :create_message, mutation: MessageMutations::Create
  end
end
