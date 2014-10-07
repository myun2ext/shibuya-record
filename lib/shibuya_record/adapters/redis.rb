require 'redis'

module ShibuyaRecord
  module Adapters
    class Redis
      attr_reader :connection

      def initialize(params)
        @connection = create_connection(params)
      end

      def self.create_connection(params)
        Redis.new(params)
      end

      def query(query_string, *params)
        connection.send(query_string, params)
      end
    end
  end
end
