module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end


    # field :create_issue, mutation: IssueMutations::Create
    field :login, mutation: UserMutations::Login
  end
end
