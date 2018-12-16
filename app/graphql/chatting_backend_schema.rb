# frozen_string_literal: true

class ChattingBackendSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  use GraphQL::Batch

  GraphQL::Relay::BaseConnection.register_connection_implementation(
    ActiveRecord::Relation, GraphQL::Relay::RelationConnection
  )

  def parse_error(err, ctx)
    return if Rails.env.development?

    ctx.errors.push([[err.class, err]])
  end

  def self.id_from_object(object, type_definition, _ctx)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  end

  def self.object_from_id(id, _ctx)
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    type_name.constantize.find(item_id)
  end

  def self.resolve_type(_type, obj, _ctx)
    "Types::#{obj.class.name}Type".constantize
  rescue NameError
    raise NotImplementedError
  end
end
