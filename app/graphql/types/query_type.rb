module Types
  class QueryType < Types::BaseObject
    field :node, field: GraphQL::Relay::Node.field, null: true
    field :nodes, field: GraphQL::Relay::Node.plural_field, null: true
    field :viewer, resolver: Resolvers::QueryType::ViewerResolver
    field :users, resolver: Resolvers::QueryType::UsersResolver
  end
end
