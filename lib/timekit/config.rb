# frozen_string_literal: true

module Timekit
  class Config < Hash
    CONFIG_KEYS = %i[
      client_key
      server_key
    ].freeze

    def []=(key, value)
      raise 'Invalid config key' unless CONFIG_KEYS.include?(key)

      super(key, value)
    end
  end
end
