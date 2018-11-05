Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  mount ActionCable.server => "/cable"
  mount GraphiQL::Rails::Engine, at: :graphiql, graphql_path: :graphql if Rails.env.development? || Rails.env.backstage?
end
