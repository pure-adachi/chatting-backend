class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def guid
    GraphQL::Schema::UniqueWithinType.encode(self.class.name, id)
  end

  def policy
    "#{self.class.name}Policy".safe_constantize
  end

  def self.locate(uid)
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(uid)
    type_name.constantize.find(item_id) if name == type_name
  rescue StandardError
    nil
  end

  def self.plural_locate(uids)
    return [] if uids.blank?

    uids.map do |id|
      type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
      type_name.constantize.find(item_id) if name == type_name
    end
  rescue StandardError
    []
  end

  def self.decode_guid(uid)
    GraphQL::Schema::UniqueWithinType.decode(uid).last
  end
end
