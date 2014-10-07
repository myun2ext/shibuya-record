require 'mongo'

module ShibuyaRecord
  module Adapters
    class Mongo
      attr_reader :connection

      def initialize(params)
        @connection = create_connection(params)
      end

      def self.create_connection(params)
        Mongo::Client.new(params)
      end

      def query(query_string, *params)
        connection.send(query_string, params)
      end
    end
  end
end
