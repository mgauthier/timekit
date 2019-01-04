# frozen_string_literal: true

require 'base64'

module Timekit
  class Client
    def initialize(server_key: Timekit.config[:server_key])
      @server_key = server_key

      raise 'No server key configured' if server_key.nil?
    end

    protected

    #
    # Wrapper method for the timekit request methods of the same names
    #
    %i[get put post delete].each do |verb|
      define_method(verb) do |path, params = {}|
        # puts "Timekit::Client::#{verb} => #{path}#{token}"
        headers = {
          'Authorization' => http_basic_auth_header
        }

        Timekit::Request.instance.send(
          __method__,
          path,
          params,
          headers
        )
      end
    end

    private

    def http_basic_auth_header
      encoded = Base64.strict_encode64(":#{@server_key}")
      "Basic #{encoded}"
    end
  end
end
