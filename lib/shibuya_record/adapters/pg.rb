require 'pg'

module ShibuyaRecord
  module Adapters
    class Postgresql
      attr_reader :connection

      def self.model
        :rdb; end

      def initialize(params)
        @connection = create_connection(params)
      end

      def self.create_connection(params)
        PG.connect(params)
      end

      def query(query_string, *params)
        connection.exec(query_string, params)
      end
    end
  end
end
