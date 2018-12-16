# frozen_string_literal: true

module UserMutations
  class Login < Mutations::BaseMutation
    graphql_name 'LoginUser'

    field :user, Types::UserType, null: true
    field :result, Boolean, null: true

    argument :loginid, String, required: true
    argument :password, String, required: true

    def ready?(**_args)
      mutation_authorize { return true if UserPolicy.new(context[:current_user], nil).login? }
    end

    def resolve(**args)
      keys         = %i[loginid password]
      login_params = args.slice(*keys)
      model        = User.new(login_params)

      user  = if model.valid?(:login)
                u = User.find_by(login_params)
                u.access_tokens.create
                u
              else
                model
              end

      {
        user: user,
        result: user.errors.blank?
      }
    end
  end
end
