require 'redis'

module ShibuyaRecord
  module Adapters
    class Redis
      attr_reader :connection

      def initialize(params = {})
        @connection = ShibuyaRecord::Adapters::Redis.create_connection(params)
      end

      def self.create_connection(params = {})
        ::Redis.new(params)
      end

      def read(key)
        connection.get key; end
      alias get read

      def write(key, value)
        connection.set key, value; end
      alias set write

      def query(query_string, *params)
        connection.send(query_string, params)
      end
    end
  end
end
