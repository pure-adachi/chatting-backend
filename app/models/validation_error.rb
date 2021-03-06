# frozen_string_literal: true

class ValidationError
  attr_accessor :field, :keys

  def initialize(field, keys)
    @field = field
    @keys = keys
  end
end
