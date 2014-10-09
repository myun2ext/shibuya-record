require 'dalli'

module ShibuyaRecord
  module Adapters
    class Dalli
      attr_reader :connection

      def initialize(params)
        @connection = create_connection(params)
      end

      def self.create_connection(params)
        Dalli::Client.new(params)
      end

      def read(key)
        connection.get key; end

      def write(key, value)
        connection.set key, value; end

      def query(query_string, *params)
        connection.send(query_string, params)
      end
    end
  end
end
