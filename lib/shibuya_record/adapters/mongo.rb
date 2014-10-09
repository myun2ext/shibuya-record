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
      def database
        @db
      end

      def collection(name)
        db.collection(name)
      end
      alias table collection
      alias coll collection

      def query(query_string, *params)
        connection.send(query_string, params)
      end

      def insert(table, values)
        coll(table).insert(values)
      end

      def where(table, conditions)
        coll(table).find(values)
      end
    end
  end
end
