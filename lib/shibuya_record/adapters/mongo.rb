require 'mongo'

module ShibuyaRecord
  module Adapters
    class Mongo
      attr_reader :connection

      def self.model
        :document; end

      def initialize(params)
        param_db_name = params.delete :database
        @connection = ShibuyaRecord::Adapters::Mongo.create_connection(params)

        select_database(param_db_name) if param_db_name
      end

      def self.create_connection(params)
        ::Mongo::Connection.new(params)
      end

      def database=(name)
        @db = connection.db(name.to_s)
      end
      def database(name = nil)
        self.database = name if name
        @db
      end
      alias select_database database=
      alias set_database database=

      def collection(name)
        @db.collection(name)
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
        coll(table).find(conditions)
      end
    end
  end
end
