require 'mongo'

module ShibuyaRecord
  module Adapters
    class Mongo
      attr_reader :connection

      def initialize(params)
        @connection = create_connection(params)
      end

      def self.create_connection(params)
        Mongo::Connection.new(params)
      end

      def database=(name)
        @db = connection.db(name)
      end

      def query(query_string, *params)
        connection.send(query_string, params)
      end

      def insert(table, values)
        coll = db.collection(table)
        coll.insert(values)
      end
    end
  end
end
