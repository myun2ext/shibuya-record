require 'dalli'

module ShibuyaRecord
  module Adapters
    class Dalli
      attr_reader :connection

      def self.model
        :kvs; end

      def initialize(params = nil)
        @connection = ShibuyaRecord::Adapters::Dalli.create_connection(params)
      end

      def self.create_connection(params)
        ::Dalli::Client.new(params)
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
