module ShibuyaRecord
  module Adapters
    require 'mysql2-cs-bind'

    class Mysql2CsBind
      attr_reader :connection

      def self.model
        :rdb; end

      def initialize(params)
        @connection = create_connection(params)
      end

      def self.create_connection(params)
        Mysql2::Client.new(params)
      end

      def query(query_string, *params)
        connection.xquery(query_string, params)
      end
    end
  end
end
